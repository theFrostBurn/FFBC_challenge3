import 'package:flutter/cupertino.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('보관함'),
      ),
      child: SafeArea(
        child: Center(
          child: Text('보관함 화면'),
        ),
      ),
    );
  }
}
