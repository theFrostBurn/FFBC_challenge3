import 'package:flutter/cupertino.dart';

class HomeAppBar extends CupertinoNavigationBar {
  const HomeAppBar({super.key})
      : super(
          middle: const Text(
            'Music',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const _TrailingButtons(),
        );
}

class _TrailingButtons extends StatelessWidget {
  const _TrailingButtons();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: null,
          child: Icon(CupertinoIcons.bell),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: null,
          child: Icon(CupertinoIcons.search),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: null,
          child: Icon(CupertinoIcons.profile_circled),
        ),
      ],
    );
  }
}
