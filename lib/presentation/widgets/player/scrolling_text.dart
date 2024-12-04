import 'package:flutter/cupertino.dart';

class ScrollingText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final double width;

  const ScrollingText({
    super.key,
    required this.text,
    required this.style,
    required this.width,
  });

  @override
  State<ScrollingText> createState() => _ScrollingTextState();
}

class _ScrollingTextState extends State<ScrollingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  final _scrollKey = GlobalKey();
  Size _textSize = Size.zero;
  bool _needsScroll = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _measureText();
    });
  }

  void _measureText() {
    final RenderBox? renderBox =
        _scrollKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      setState(() {
        _textSize = renderBox.size;
        _needsScroll = _textSize.width > widget.width;

        if (_needsScroll) {
          final scrollDistance = _textSize.width - widget.width;
          _offsetAnimation = Tween<Offset>(
            begin: Offset.zero,
            end: Offset(-scrollDistance - 40, 0), // 여유 공간 추가
          ).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ));

          _controller.repeat(reverse: true);
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ScrollingText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _measureText();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: ClipRect(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            if (!_needsScroll) {
              return Text(
                widget.text,
                style: widget.style,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              );
            }

            return Transform.translate(
              offset: _offsetAnimation.value,
              child: child,
            );
          },
          child: Text(
            widget.text,
            key: _scrollKey,
            style: widget.style,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
