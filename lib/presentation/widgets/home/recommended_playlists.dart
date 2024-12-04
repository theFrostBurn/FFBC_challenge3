import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecommendedPlaylists extends StatelessWidget {
  const RecommendedPlaylists({super.key});

  @override
  Widget build(BuildContext context) {
    // 더미 플레이리스트 데이터
    final playlists = [
      {
        'title': 'K-POP 히트곡 모음',
        'imageUrl': 'https://i.ytimg.com/vi/cXCBiF67jLM/maxresdefault.jpg',
      },
      {
        'title': '운동할 때 듣기 좋은 음악',
        'imageUrl': 'https://i.ytimg.com/vi/9HDEHj2yzew/maxresdefault.jpg',
      },
      {
        'title': '잔잔한 발라드 모음',
        'imageUrl': 'https://i.ytimg.com/vi/mZz9uYdj_v4/maxresdefault.jpg',
      },
      {
        'title': '드라이브 플레이리스트',
        'imageUrl': 'https://i.ytimg.com/vi/D_nyuB8GbM8/maxresdefault.jpg',
      },
      {
        'title': '공부할 때 듣는 음악',
        'imageUrl': 'https://i.ytimg.com/vi/DWcJFNfaw9c/maxresdefault.jpg',
      },
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
