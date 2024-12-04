import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../data/services/audio_service.dart';
import '../../../data/services/navigation_service.dart';
import 'scrolling_text.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final audioService = context.watch<AudioService>();
    final currentTrack = audioService.currentTrack;

    if (currentTrack == null) return const SizedBox.shrink();

    return Container(
      height: 64,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            context.read<NavigationService>().navigateToTab(1);
          },
          child: Row(
            children: [
              // 앨범 아트
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  image: currentTrack.thumbnailUrl != null
                      ? DecorationImage(
                          image: NetworkImage(currentTrack.thumbnailUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                  color: CupertinoColors.systemGrey6,
                ),
                child: currentTrack.thumbnailUrl == null
                    ? const Icon(
                        CupertinoIcons.music_note,
                        color: CupertinoColors.systemGrey,
                      )
                    : null,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ScrollingText(
                        text: currentTrack.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        width: 200,
                      ),
                      const SizedBox(height: 4),
                      ScrollingText(
                        text: currentTrack.artist,
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              CupertinoColors.systemGrey.resolveFrom(context),
                        ),
                        width: 200,
                      ),
                    ],
                  ),
                ),
              ),
              // 재생/일시정지 버튼
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                onPressed: () => audioService.togglePlay(),
                child: Icon(
                  audioService.isPlaying
                      ? CupertinoIcons.pause_fill
                      : CupertinoIcons.play_fill,
                  size: 28,
                  color: CupertinoColors.activeBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
