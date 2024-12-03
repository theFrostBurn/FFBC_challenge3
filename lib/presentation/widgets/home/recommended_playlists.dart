import 'package:flutter/cupertino.dart';

class RecommendedPlaylists extends StatelessWidget {
  const RecommendedPlaylists({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
            child: Text(
              '추천 플레이리스트',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Container(
                        width: 160,
                        color: CupertinoColors.systemGrey5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 160,
                              color: CupertinoColors.systemGrey4,
                              child: const Center(
                                child: Icon(
                                  CupertinoIcons.music_note_2,
                                  size: 48,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '플레이리스트 ${index + 1}',
                                style: const TextStyle(
                                  color: CupertinoColors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
