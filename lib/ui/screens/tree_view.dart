import 'package:flutter/material.dart';
import 'package:task_force/models/category_demo.dart';

class CategoryTree extends StatefulWidget {
  const CategoryTree({super.key});

  @override
  _CategoryTreeState createState() => _CategoryTreeState();
}

class _CategoryTreeState extends State<CategoryTree> {
  final List<Category> categories = [
    Category(
      "Vehicles",
      children: [
        Category("Electric Vehicle", children: [Category("Tesla")]),
      ],
    ),
    Category("Apparel", children: [Category("Sportswear")]),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:
          categories
              .map(
                (category) => CategoryWidget(
                  category: category,
                  level: 0,
                  onToggle: () => setState(() {}),
                ),
              )
              .toList(),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final Category category;
  final int level;
  final VoidCallback onToggle;

  const CategoryWidget({
    Key? key,
    required this.category,
    required this.level,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            category.isExpanded = !category.isExpanded;
            onToggle();
          },
          child: Container(
            margin: EdgeInsets.only(left: level * 20.0, bottom: 8),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.blue[700],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Text(
                  category.isExpanded ? "-" : "+",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  category.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (category.isExpanded)
          ...category.children
              .map(
                (child) => CategoryWidget(
                  category: child,
                  level: level + 1,
                  onToggle: onToggle,
                ),
              )
              .toList(),
      ],
    );
  }
}
