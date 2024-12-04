import 'package:flutter/cupertino.dart';

class RecommendedPlaylists extends StatelessWidget {
  const RecommendedPlaylists({super.key});

  @override
  Widget build(BuildContext context) {
    final playlists = [
      {'title': 'K-POP 히트곡 모음', 'imageId': '200'},
      {'title': '드라이브 뮤직', 'imageId': '201'},
      {'title': '편안한 어쿠스틱', 'imageId': '202'},
      {'title': '운동할 때 듣기 좋은', 'imageId': '203'},
      {'title': '공부할 때 집중되는', 'imageId': '204'},
      {'title': '출근길 플레이리스트', 'imageId': '205'},
      {'title': '잔잔한 재즈 컬렉션', 'imageId': '206'},
      {'title': '인디음악 베스트', 'imageId': '207'},
      {'title': '2024 최신 트렌드', 'imageId': '208'},
    ];

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
            child: Text(
              '추천 플레이리스트',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: playlists.length,
              itemBuilder: (context, index) {
                final playlist = playlists[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: CupertinoColors.systemGrey5,
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://picsum.photos/seed/${playlist['imageId']}/160',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 160,
                        child: Text(
                          playlist['title']!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
