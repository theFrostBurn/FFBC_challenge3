import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'data/services/audio_service.dart';
import 'data/services/youtube_service.dart';
import 'data/services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final youtubeService = YoutubeService();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => youtubeService),
        ChangeNotifierProvider(
          create: (_) => AudioService(youtubeService),
        ),
        ChangeNotifierProvider(create: (_) => NavigationService()),
      ],
      child: const MusicPlayerApp(),
    ),
  );
}
