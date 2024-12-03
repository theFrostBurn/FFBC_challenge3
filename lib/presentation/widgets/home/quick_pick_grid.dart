import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../../../domain/entities/track.dart';
import '../../../data/services/audio_service.dart';
import '../../../data/services/youtube_service.dart';

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
      onPressed: () async {
        try {
          final youtubeService = context.read<YoutubeService>();
          final audioService = context.read<AudioService>();

          // 현재 재생 중인 트랙 정보 표시
          if (context.mounted) {
            await showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('재생 준비 중'),
                content: Text('${track.title}\n${track.artist}'),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('취소'),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                  CupertinoDialogAction(
                    child: const Text('재생'),
                    onPressed: () => Navigator.pop(context, true),
                  ),
                ],
              ),
            ).then((shouldPlay) async {
              if (shouldPlay == true) {
                // YouTube URL에서 실제 스트리밍 URL 가져오기
                final trackWithUrl =
                    await youtubeService.getTrackFromUrl(track.videoUrl!);
                // 트랙 재생
                await audioService.play(trackWithUrl);
              }
            });
          }
        } catch (e) {
          // 에러 메시지 표시
          if (context.mounted) {
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('재생 실패'),
                content: Text('오류: $e'),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('확인'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            );
          }
        }
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
