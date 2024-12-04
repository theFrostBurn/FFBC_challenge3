import 'package:flutter/cupertino.dart';
import '../../../data/services/audio_service.dart';

class AnimatedShuffleButton extends StatefulWidget {
  final AudioService audioService;

  const AnimatedShuffleButton({
    super.key,
    required this.audioService,
  });

  @override
  State<AnimatedShuffleButton> createState() => _AnimatedShuffleButtonState();
}

class _AnimatedShuffleButtonState extends State<AnimatedShuffleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _rotateAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotateAnimation.value * 2 * 3.14159,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              widget.audioService.toggleShuffle();
              _controller.forward(from: 0);
            },
            child: Icon(
              CupertinoIcons.shuffle,
              color: widget.audioService.isShuffleOn
                  ? CupertinoColors.activeBlue
                  : CupertinoColors.systemGrey,
              size: 25,
            ),
          ),
        );
      },
    );
  }
}
