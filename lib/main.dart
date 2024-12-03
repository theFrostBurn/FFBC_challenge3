import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'data/services/audio_service.dart';
import 'data/services/youtube_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => YoutubeService()),
        Provider(create: (_) => AudioService()),
      ],
      child: const MusicPlayerApp(),
    ),
  );
}
