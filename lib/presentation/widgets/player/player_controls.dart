import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../data/services/audio_service.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key});

  @override
  Widget build(BuildContext context) {
    final audioService = context.watch<AudioService>();

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
            if (audioService.currentTrack != null) {
              audioService.resume();
            }
          },
          child: const Icon(
            CupertinoIcons.play_fill,
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
