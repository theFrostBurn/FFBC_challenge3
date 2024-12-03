import 'package:flutter/cupertino.dart';
import '../../../data/services/youtube_service.dart';
import '../../../data/services/audio_service.dart';

class QuickPickGrid extends StatelessWidget {
  const QuickPickGrid({super.key});

  Future<void> _testPlayMusic(BuildContext context) async {
    final youtubeService = YoutubeService();
    final audioService = AudioService();

    try {
      // 테스트용 YouTube URL (NCS 저작권 무료 음악)
      const testUrl = 'https://www.youtube.com/watch?v=K4DyBUG242c';

      // URL에서 트랙 정보 가져오기
      final track = await youtubeService.getTrackFromUrl(testUrl);

      // 트랙 재생
      await audioService.play(track);

      // 성공 메시지 표시
      if (context.mounted) {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('재생 성공'),
            content: Text('현재 재생 중: ${track.title}'),
            actions: [
              CupertinoDialogAction(
                child: const Text('확인'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
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
    } finally {
      youtubeService.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '빠른 선곡',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => _testPlayMusic(context),
                  child: const Text('테스트 재생'),
                ),
              ],
            ),
          ),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Container(
                    color: CupertinoColors.systemGrey5,
                    child: Center(
                      child: Text(
                        '선곡 ${index + 1}',
                        style: const TextStyle(
                          color: CupertinoColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
