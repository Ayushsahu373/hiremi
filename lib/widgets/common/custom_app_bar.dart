import 'package:flutter/material.dart';
import 'package:hiremi_dashboard/screens/notification_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return AppBar(
      backgroundColor: const Color(0xFF0F3CC9),
      toolbarHeight: height * 0.07,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
          size: width * 0.06,
        ),
        padding: EdgeInsets.all(width * 0.02),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      centerTitle: true,
      titleSpacing: width * 0.02,
      title: Text(
        'Hiremi',
        style: TextStyle(
          color: Colors.white,
          fontSize: width * 0.055,
          fontWeight: FontWeight.w600,
          letterSpacing: width * 0.001,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: width * 0.02),
          child: IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.white,
              size: width * 0.06,
            ),
            padding: EdgeInsets.all(width * 0.02),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NotificationScreen()),
            ),
          ),
        ),
      ],
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(0),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
