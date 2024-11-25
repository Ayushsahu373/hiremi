import 'package:flutter/material.dart';
import 'package:hiremi_dashboard/constants/constants.dart';
import 'package:hiremi_dashboard/widgets/common/custom_bottom_nav_bar.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = '/notifications';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: const Color(0xFF1F1F1F),
              size: width * 0.06,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
          title: Text(
            'Help & Support',
            style: TextStyle(
              color: const Color(0xFF1F1F1F),
              fontSize: width * 0.055,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: width * 0.02),
              child: IconButton(
                icon: Icon(
                  Icons.bookmark_border_outlined,
                  color: const Color(0xFF1F1F1F),
                  size: width * 0.06,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Notification Image
            Container(
              width: width * 0.7,
              height: width * 0.7,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6).withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  AppImages.notificationEmpty,
                  width: width * 0.5,
                  height: width * 0.5,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: height * 0.04),

            // No Notifications Text
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: width * 0.045,
                  height: 1.5,
                  color: const Color(0xFF1F1F1F),
                ),
                children: [
                  TextSpan(
                    text: 'NNN: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: width * 0.048,
                    ),
                  ),
                  TextSpan(
                    text: 'No New Notifications!',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.045,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.015),

            // Subtitle Text
            Text(
              'Please Explore HireMi Application for a while.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: width * 0.038,
                color: const Color(0xFF6B7280),
                height: 1.4,
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: 0,
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
