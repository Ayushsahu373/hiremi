import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        bottom: screenHeight * 0.01,
        right: screenWidth * 0.02,
        left: screenWidth * 0.02,
      ),
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.085,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, -1),
              blurRadius: 4,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenWidth * 0.04),
            topRight: Radius.circular(screenWidth * 0.04),
            bottomLeft: Radius.circular(screenWidth * 0.08),
            bottomRight: Radius.circular(screenWidth * 0.08),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(context, Icons.home, "Home", 0),
            _buildNavItem(context, Icons.work, "Jobs", 1),
            _buildNavItem(context, Icons.explore, "Ask Expert", 2),
            _buildNavItem(context, Icons.list, "Status", 3),
            _buildNavItemWithBadge(
                context, Icons.all_inclusive, "HireMi", "360", 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, IconData icon, String label, int index) {
    bool isSelected = selectedIndex == index;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.black,
            size: screenWidth * 0.06,
          ),
          SizedBox(height: screenWidth * 0.01),
          Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.028,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItemWithBadge(BuildContext context, IconData icon,
      String label, String subLabel, int index) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenWidth * 0.085,
            height: screenWidth * 0.085,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0F3CC9), Color(0xFFACC0FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.21),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(screenWidth * 0.25),
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
                size: screenWidth * 0.05,
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.01),
          Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.025,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Text(
            subLabel,
            style: TextStyle(
              fontSize: screenWidth * 0.025,
              fontWeight: FontWeight.w600,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [Color(0xFF0188EA), Color(0xFFAFD7FF)],
                ).createShader(Rect.fromLTWH(0, 0, 100, 20)),
            ),
          ),
        ],
      ),
    );
  }
}
