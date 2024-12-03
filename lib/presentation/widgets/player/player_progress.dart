import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../data/services/audio_service.dart';

class PlayerProgress extends StatelessWidget {
  const PlayerProgress({super.key});

  String _formatDuration(Duration? duration) {
    if (duration == null) return '--:--';
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final audioService = context.watch<AudioService>();

    return StreamBuilder<Duration?>(
      stream: audioService.positionStream,
      builder: (context, snapshot) {
        final position = snapshot.data ?? Duration.zero;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              CupertinoSlider(
                value: position.inSeconds.toDouble(),
                max: 100, // TODO: 실제 트랙 길이로 변경
                onChanged: (value) {
                  audioService.seek(Duration(seconds: value.toInt()));
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_formatDuration(position)),
                    Text(_formatDuration(
                        const Duration(minutes: 3))), // TODO: 실제 트랙 길이로 변경
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
