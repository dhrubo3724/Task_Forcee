import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions; // Optional actions for the AppBar
  final Color? backgroundColor; // Optional background color

  const ProfileAppBar({
    super.key,
    required this.title,
    this.actions,
    this.backgroundColor, // Allow customizing background color
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      // Use provided color or default to theme.color, // Use provided color or default to green
      title: Text(title), // Use the passed title
      centerTitle:
          true, // Center the title (you can make this a parameter too if needed)
      actions: actions, // Include optional actions
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
