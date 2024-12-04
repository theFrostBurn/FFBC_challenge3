import 'package:flutter/cupertino.dart';

class NavigationService extends ChangeNotifier {
  final tabController = CupertinoTabController();

  void navigateToTab(int index) {
    tabController.index = index;
    notifyListeners();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
