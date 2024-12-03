import 'package:flutter/cupertino.dart';
import '../../../domain/entities/category.dart';

class CategoryFilterBar extends StatelessWidget {
  final List<Category> categories;
  final Category? selectedCategory;
  final ValueChanged<Category> onCategorySelected;

  const CategoryFilterBar({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            final isSelected = selectedCategory?.id == category.id;

            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: isSelected
                    ? CupertinoColors.activeBlue
                    : CupertinoColors.systemGrey5,
                borderRadius: BorderRadius.circular(20),
                onPressed: () => onCategorySelected(category),
                child: Text(
                  category.name,
                  style: TextStyle(
                    color: isSelected
                        ? CupertinoColors.white
                        : CupertinoColors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
