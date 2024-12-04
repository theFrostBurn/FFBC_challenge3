import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../data/services/audio_service.dart';
import 'animated_favorite_button.dart';
import 'animated_shuffle_button.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key});

  @override
  Widget build(BuildContext context) {
    final audioService = context.watch<AudioService>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedFavoriteButton(audioService: audioService),
          // 이전 곡 버튼
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => audioService.playPrevious(),
            child: const Icon(
              CupertinoIcons.backward_fill,
              size: 35,
            ),
          ),
          // 재생/일시정지 버튼
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => audioService.togglePlay(),
            child: Icon(
              audioService.isPlaying
                  ? CupertinoIcons.pause_circle_fill
                  : CupertinoIcons.play_circle_fill,
              size: 64,
            ),
          ),
          // 다음 곡 버튼
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => audioService.playNext(),
            child: const Icon(
              CupertinoIcons.forward_fill,
              size: 35,
            ),
          ),
          AnimatedShuffleButton(audioService: audioService),
        ],
      ),
    );
  }
}
