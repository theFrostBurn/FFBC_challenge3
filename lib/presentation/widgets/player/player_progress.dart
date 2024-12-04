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
      stream: audioService.durationStream,
      builder: (context, durationSnapshot) {
        return StreamBuilder<Duration?>(
          stream: audioService.positionStream,
          builder: (context, positionSnapshot) {
            final duration =
                durationSnapshot.data ?? const Duration(minutes: 3);
            final position = positionSnapshot.data ?? Duration.zero;

            // position이 duration을 초과하지 않도록 보장
            final currentPosition = position > duration ? duration : position;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  CupertinoSlider(
                    value: currentPosition.inSeconds.toDouble(),
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    onChanged: (value) {
                      audioService.seek(Duration(seconds: value.toInt()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_formatDuration(currentPosition)),
                        Text(_formatDuration(duration)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
