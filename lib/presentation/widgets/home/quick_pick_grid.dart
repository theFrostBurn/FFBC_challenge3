import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../../../domain/entities/track.dart';
import '../../../domain/entities/category.dart';
import '../../../data/services/audio_service.dart';
import '../../../data/services/youtube_service.dart';
import '../../../data/services/navigation_service.dart';
import '../../../data/constants/track_data.dart';

class QuickPickGrid extends StatelessWidget {
  final Category? selectedCategory;

  const QuickPickGrid({super.key, this.selectedCategory});

  List<Track> _getTracksByCategory(String? categoryId) {
    final Map<String, List<Track>> categoryTracks = {
      'all': TrackData.allTracks,
      'kpop': TrackData.kpopTracks,
      'hiphop': TrackData.hiphopTracks,
      'pop': TrackData.popTracks,
      'indie': TrackData.indieTracks,
      'relax': TrackData.relaxTracks,
    };

    return categoryId == null
        ? TrackData.allTracks
        : (categoryTracks[categoryId] ?? TrackData.allTracks);
  }

  @override
  Widget build(BuildContext context) {
    final tracks = _getTracksByCategory(selectedCategory?.id);

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12, // 간격 줄임
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final track = tracks[index];
            return _QuickPickItem(track: track);
          },
          childCount: tracks.length, // 6개로 변경
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

                // 재생 화면으로 전환
                if (context.mounted) {
                  final navigationService = context.read<NavigationService>();
                  navigationService.navigateToTab(1); // 샘플(재생) 탭으로 전환
                }
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
