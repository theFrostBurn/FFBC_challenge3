import 'package:flutter/cupertino.dart';
import '../../widgets/home/home_app_bar.dart';
import '../../widgets/home/category_filter_bar.dart';
import '../../widgets/home/quick_pick_grid.dart';
import '../../widgets/home/recommended_playlists.dart';
import '../../../domain/entities/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Category? _selectedCategory;

  final List<Category> _categories = const [
    Category(id: 'all', name: '전체'),
    Category(id: 'workout', name: '운동'),
    Category(id: 'energy', name: '에너지 충전'),
    Category(id: 'podcast', name: '팟캐스트'),
    Category(id: 'focus', name: '집중'),
    Category(id: 'sleep', name: '수면'),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const HomeAppBar(),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          CategoryFilterBar(
            categories: _categories,
            selectedCategory: _selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                _selectedCategory = category;
              });
            },
          ),
          const QuickPickGrid(),
          const RecommendedPlaylists(),
          const SliverToBoxAdapter(
            child: SizedBox(height: 60),
          ),
        ],
      ),
    );
  }
}
