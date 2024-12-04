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
        // 이전 곡 버튼
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => audioService.playPrevious(), // 이전 곡 재생 기능 연결
          child: const Icon(
            CupertinoIcons.backward_fill,
            size: 35,
          ),
        ),
        const SizedBox(width: 32),
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
        const SizedBox(width: 32),
        // 다음 곡 버튼
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => audioService.playNext(), // 다음 곡 재생 기능 연결
          child: const Icon(
            CupertinoIcons.forward_fill,
            size: 35,
          ),
        ),
      ],
    );
  }
}
