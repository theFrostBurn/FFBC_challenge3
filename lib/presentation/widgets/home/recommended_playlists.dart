import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecommendedPlaylists extends StatelessWidget {
  const RecommendedPlaylists({super.key});

  @override
  Widget build(BuildContext context) {
    final playlists = [
      {'title': 'K-POP 히트곡 모음', 'imageUrl': '...'},
      {'title': '2024 최신 트렌드', 'imageUrl': '...'},
      {'title': '인기 팝송 플레이리스트', 'imageUrl': '...'},
      {'title': '드라이브 뮤직', 'imageUrl': '...'},
      {'title': '편안한 어쿠스틱', 'imageUrl': '...'},
      {'title': '운동할 때 듣기 좋은', 'imageUrl': '...'},
      {'title': '공부할 때 집중되는', 'imageUrl': '...'},
      {'title': '출근길 플레이리스트', 'imageUrl': '...'},
      {'title': '잔잔한 재즈 컬렉션', 'imageUrl': '...'},
      {'title': '인디음악 베스트', 'imageUrl': '...'},
    ];

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '추천 플레이리스트',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: playlists.length,
              itemBuilder: (context, index) {
                final playlist = playlists[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: CupertinoColors.systemGrey6,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8),
                              ),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: CachedNetworkImage(
                              imageUrl: playlist['imageUrl']!,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                child: CupertinoActivityIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Center(
                                child: Icon(
                                  CupertinoIcons.music_note_2,
                                  size: 48,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              playlist['title']!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: CupertinoColors.black,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
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
