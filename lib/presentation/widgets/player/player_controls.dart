import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../data/services/audio_service.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key});

  @override
  Widget build(BuildContext context) {
    final audioService = context.watch<AudioService>();
    final isPlaying = audioService.isPlaying;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // TODO: 이전 트랙
          },
          child: const Icon(
            CupertinoIcons.backward_fill,
            size: 40,
          ),
        ),
        const SizedBox(width: 32),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            audioService.togglePlay();
          },
          child: Icon(
            isPlaying ? CupertinoIcons.pause_fill : CupertinoIcons.play_fill,
            size: 50,
          ),
        ),
        const SizedBox(width: 32),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // TODO: 다음 트랙
          },
          child: const Icon(
            CupertinoIcons.forward_fill,
            size: 40,
          ),
        ),
      ],
    );
  }
}
