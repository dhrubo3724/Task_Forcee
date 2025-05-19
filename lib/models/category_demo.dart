class Category {
  final String title;
  final List<Category> children;
  bool isExpanded;

  Category(this.title, {this.children = const [], this.isExpanded = false});
}
