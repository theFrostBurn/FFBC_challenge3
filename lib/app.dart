import 'package:flutter/cupertino.dart';
import 'config/theme.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/explore/explore_page.dart';
import 'presentation/pages/library/library_page.dart';
import 'presentation/pages/player/player_page.dart';

class MusicPlayerApp extends StatelessWidget {
  const MusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Music Player',
      theme: appTheme,
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.music_note),
              label: '샘플',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.compass),
              label: '둘러보기',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.collections),
              label: '보관함',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return const HomePage();
                case 1:
                  return const PlayerPage();
                case 2:
                  return const ExplorePage();
                case 3:
                  return const LibraryPage();
                default:
                  return const HomePage();
              }
            },
          );
        },
      ),
    );
  }
}
