import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../domain/entities/track.dart';

class QuickPickGrid extends StatelessWidget {
  const QuickPickGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // 더미 데이터
    final tracks = [
      const Track(
        id: '1',
        title: 'Butter',
        artist: 'BTS',
        thumbnailUrl: 'https://i.ytimg.com/vi/WMweEpGlu_U/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=WMweEpGlu_U',
      ),
      const Track(
        id: '2',
        title: 'Dynamite',
        artist: 'BTS',
        thumbnailUrl: 'https://i.ytimg.com/vi/gdZLi9oWNZg/maxresdefault.jpg',
        videoUrl: 'https://www.youtube.com/watch?v=gdZLi9oWNZg',
      ),
      // 더 많은 더미 트랙 추가...
    ];

    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final track = tracks[index % tracks.length];
            return _QuickPickItem(track: track);
          },
          childCount: 4,
        ),
      ),
    );
  }
}

class _QuickPickItem extends StatelessWidget {
  final Track track;

  const _QuickPickItem({required this.track});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        // TODO: 트랙 재생 구현
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: CupertinoColors.systemGrey6,
        ),
        clipBehavior: Clip.antiAlias,
        child: track.thumbnailUrl != null
            ? CachedNetworkImage(
                imageUrl: track.thumbnailUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CupertinoActivityIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(
                  CupertinoIcons.music_note,
                  size: 48,
                ),
              )
            : const Icon(
                CupertinoIcons.music_note,
                size: 48,
              ),
      ),
    );
  }
}
