import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../data/services/audio_service.dart';
import '../../../data/services/navigation_service.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final audioService = context.watch<AudioService>();
    final currentTrack = audioService.currentTrack;

    if (currentTrack == null) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () {
        // 전체 화면 플레이어로 전환
        context.read<NavigationService>().navigateToTab(1);
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground,
          border: Border(
            top: BorderSide(
              color: CupertinoColors.systemGrey4.withOpacity(0.5),
            ),
          ),
        ),
        child: Row(
          children: [
            // 썸네일
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: CupertinoColors.systemGrey6,
              ),
              clipBehavior: Clip.antiAlias,
              child: currentTrack.thumbnailUrl != null
                  ? Image.network(
                      currentTrack.thumbnailUrl!,
                      fit: BoxFit.cover,
                    )
                  : const Icon(
                      CupertinoIcons.music_note,
                      size: 20,
                      color: CupertinoColors.systemGrey,
                    ),
            ),
            // 트랙 정보
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentTrack.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    currentTrack.artist,
                    style: const TextStyle(
                      fontSize: 12,
                      color: CupertinoColors.systemGrey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // 재생 컨트롤
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                audioService.togglePlay();
              },
              child: Icon(
                audioService.isPlaying
                    ? CupertinoIcons.pause_fill
                    : CupertinoIcons.play_fill,
                size: 30,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
