import 'package:flutter/cupertino.dart';
import 'config/theme.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/explore/explore_page.dart';
import 'presentation/pages/library/library_page.dart';
import 'presentation/pages/player/player_page.dart';
import 'package:provider/provider.dart';
import 'data/services/navigation_service.dart';
import 'presentation/widgets/player/mini_player.dart';
import 'data/services/audio_service.dart';
import 'data/services/youtube_service.dart';

class MusicPlayerApp extends StatelessWidget {
  const MusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Music Player',
      theme: appTheme,
      home: AppTabScaffold(),
    );
  }
}

class AppTabScaffold extends StatefulWidget {
  const AppTabScaffold({super.key});

  @override
  State<AppTabScaffold> createState() => _AppTabScaffoldState();
}

class _AppTabScaffoldState extends State<AppTabScaffold> {
  int _selectedIndex = 0;
  late final NavigationService _navigationService;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _navigationService = Provider.of<NavigationService>(context);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _navigationService.tabController,
      tabBar: CupertinoTabBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
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
            return MultiProvider(
              providers: [
                ChangeNotifierProvider.value(
                    value: context.read<AudioService>()),
                Provider.value(value: context.read<YoutubeService>()),
                ChangeNotifierProvider.value(
                    value: context.read<NavigationService>()),
              ],
              child: SafeArea(
                child: Stack(
                  children: [
                    switch (index) {
                      0 => const HomePage(),
                      1 => const PlayerPage(),
                      2 => const ExplorePage(),
                      3 => const LibraryPage(),
                      _ => const HomePage(),
                    },
                    const Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: MiniPlayer(),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _navigationService.dispose();
    super.dispose();
  }
}
