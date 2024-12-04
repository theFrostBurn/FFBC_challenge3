import 'package:flutter/cupertino.dart';
import '../../widgets/home/home_app_bar.dart';
import '../../widgets/home/category_filter_bar.dart';
import '../../widgets/home/quick_pick_grid.dart';
import '../../widgets/home/recommended_playlists.dart';
import '../../widgets/home/trend_hot_grid.dart';
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
    Category(id: 'kpop', name: 'K-POP'),
    Category(id: 'hiphop', name: 'Hip-hop'),
    Category(id: 'pop', name: 'POP'),
    Category(id: 'indie', name: 'Indie'),
    Category(id: 'relax', name: '릴렉스'),
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
          QuickPickGrid(selectedCategory: _selectedCategory),
          const RecommendedPlaylists(),
          const TrendHotGrid(),
          const SliverToBoxAdapter(
            child: SizedBox(height: 60),
          ),
        ],
      ),
    );
  }
}
