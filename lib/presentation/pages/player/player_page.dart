import 'package:flutter/cupertino.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('샘플'),
      ),
      child: SafeArea(
        child: Center(
          child: Text('샘플 화면'),
        ),
      ),
    );
  }
}
