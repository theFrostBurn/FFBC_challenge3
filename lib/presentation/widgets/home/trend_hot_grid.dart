import 'package:flutter/cupertino.dart';
import '../../../domain/entities/track.dart';
import 'package:provider/provider.dart';
import '../../../data/services/audio_service.dart';
import '../../../data/services/youtube_service.dart';
import '../../../data/services/navigation_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../data/constants/track_data.dart';

class TrendHotGrid extends StatelessWidget {
  const TrendHotGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final trendTracks = TrackData.trendTracks;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Trend Hot 6',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 16,
                childAspectRatio: 1.5,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                final track = trendTracks[index];
                return _TrendHotItem(track: track);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TrendHotItem extends StatefulWidget {
  final Track track;

  const _TrendHotItem({required this.track});

  @override
  State<_TrendHotItem> createState() => _TrendHotItemState();
}

class _TrendHotItemState extends State<_TrendHotItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.1),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.1, end: 1.0),
        weight: 50,
      ),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () async {
        try {
          final audioService = context.read<AudioService>();

          // 애니메이션 실행
          await _controller.forward();

          // 곡 재생
          if (widget.track.youtubeUrl != null) {
            await audioService.play(widget.track);
            if (context.mounted) {
              context.read<NavigationService>().navigateToTab(1);
            }
          }
        } catch (e) {
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
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: CupertinoColors.systemGrey6,
              ),
              clipBehavior: Clip.antiAlias,
              child: widget.track.thumbnailUrl != null
                  ? CachedNetworkImage(
                      imageUrl: widget.track.thumbnailUrl!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CupertinoActivityIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        CupertinoIcons.music_note,
                        size: 48,
                      ),
                    )
                  : const Icon(
                      CupertinoIcons.music_note,
                      size: 48,
                    ),
            ),
          );
        },
      ),
    );
  }
}
