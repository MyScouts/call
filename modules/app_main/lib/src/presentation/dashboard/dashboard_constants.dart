class AppItem {
  final String title;
  final String avatar;
  final String? routeName;
  final int width;
  final int height;

  AppItem({
    required this.avatar,
    required this.title,
    this.routeName,
    this.height = 1,
    this.width = 1,
  });
}
