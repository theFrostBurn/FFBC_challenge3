import 'package:flutter/cupertino.dart';
import '../presentation/pages/home/home_page.dart';
import '../presentation/pages/player/player_page.dart';
import '../presentation/pages/explore/explore_page.dart';
import '../presentation/pages/library/library_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String player = '/player';
  static const String explore = '/explore';
  static const String library = '/library';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    player: (context) => const PlayerPage(),
    explore: (context) => const ExplorePage(),
    library: (context) => const LibraryPage(),
  };
}
