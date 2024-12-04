import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'data/services/audio_service.dart';
import 'data/services/youtube_service.dart';
import 'data/services/navigation_service.dart';
import 'core/utils/url_validator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UrlValidator.validateTrackData();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => YoutubeService()),
        ChangeNotifierProvider(create: (_) => AudioService()),
        ChangeNotifierProvider(create: (_) => NavigationService()),
      ],
      child: const MusicPlayerApp(),
    ),
  );
}
