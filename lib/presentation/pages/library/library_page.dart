import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../data/services/audio_service.dart';
import '../../../data/services/navigation_service.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final audioService = context.watch<AudioService>();
    final favorites = audioService.favorites;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('보관함'),
      ),
      child: favorites.isEmpty
          ? const Center(
              child: Text('즐겨찾기한 곡이 없습니다'),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final track = favorites[index];
                return CupertinoListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: track.thumbnailUrl != null
                          ? DecorationImage(
                              image: NetworkImage(track.thumbnailUrl!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: track.thumbnailUrl == null
                        ? const Icon(CupertinoIcons.music_note)
                        : null,
                  ),
                  title: Text(track.title),
                  subtitle: Text(track.artist),
                  trailing: const Icon(CupertinoIcons.heart_fill,
                      color: CupertinoColors.systemRed),
                  onTap: () async {
                    await audioService.play(track);
                    if (context.mounted) {
                      context.read<NavigationService>().navigateToTab(1);
                    }
                  },
                );
              },
            ),
    );
  }
}
