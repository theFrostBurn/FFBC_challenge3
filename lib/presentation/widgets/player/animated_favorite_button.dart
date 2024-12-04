import 'package:flutter/cupertino.dart';
import '../../../data/services/audio_service.dart';

class AnimatedFavoriteButton extends StatefulWidget {
  final AudioService audioService;

  const AnimatedFavoriteButton({
    super.key,
    required this.audioService,
  });

  @override
  State<AnimatedFavoriteButton> createState() => _AnimatedFavoriteButtonState();
}

class _AnimatedFavoriteButtonState extends State<AnimatedFavoriteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _translateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.2),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.2, end: 1.0),
        weight: 50,
      ),
    ]).animate(_controller);

    _translateAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: -10),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: -10, end: 0),
        weight: 50,
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = widget.audioService.currentTrack != null &&
        widget.audioService
            .isFavoriteTrack(widget.audioService.currentTrack!.id);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _translateAnimation.value),
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                widget.audioService.toggleFavorite();
                _controller.forward(from: 0);
              },
              child: Icon(
                isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                color: isFavorite
                    ? CupertinoColors.systemRed
                    : CupertinoColors.systemGrey,
                size: 25,
              ),
            ),
          ),
        );
      },
    );
  }
}
