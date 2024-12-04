import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../widgets/player/player_controls.dart';
import '../../widgets/player/player_progress.dart';
import '../../../data/services/audio_service.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final audioService = context.watch<AudioService>();
    final currentTrack = audioService.currentTrack;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('지금 재생 중'),
      ),
      child: currentTrack == null
          ? const Center(
              child: Text('재생 중인 트랙이 없습니다'),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 앨범 아트
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
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
                              size: 150,
                              color: CupertinoColors.systemGrey,
                            ),
                    ),
                    const SizedBox(height: 32),
                    // 트랙 정보
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        children: [
                          Text(
                            currentTrack.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            currentTrack.artist,
                            style: const TextStyle(
                              fontSize: 18,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // 재생 진행바
                    const PlayerProgress(),
                    const SizedBox(height: 32),
                    // 재생 컨트롤
                    const PlayerControls(),
                  ],
                ),
              ),
            ),
    );
  }
}
