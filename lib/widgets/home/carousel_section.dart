import 'package:flutter/material.dart';
import 'dart:async';

import 'package:hiremi_dashboard/constants/constants.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({super.key});

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  int _currentPage = 0;
  final PageController _pageController = PageController(
    viewportFraction: 0.92,
    initialPage: 0,
  );
  Timer? _timer;

  final List<CarouselItem> carouselItems = [
    CarouselItem(
      title: 'Step 1',
      subtitle: 'Complete\nProfile',
      imagePath: 'lib/assets/complete_profile.png',
      gradientColors: [Colors.white, Colors.white],
    ),
    CarouselItem(
      title: 'Step 2',
      subtitle: 'Verification\nPayment',
      imagePath: 'lib/assets/verification_payment.png',
      gradientColors: [Colors.white, Colors.white],
    ),
    CarouselItem(
      title: 'Step 3',
      subtitle: 'Wait for\nVerification',
      imagePath: 'lib/assets/wait_verification.png',
      gradientColors: [Colors.white, Colors.white],
    ),
    CarouselItem(
      title: 'Step 4',
      subtitle: 'Get Lifetime\nAccess',
      imagePath: 'lib/assets/lifetime_access.png',
      gradientColors: [Colors.white, Colors.white],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentPage < carouselItems.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _handlePageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _handleUserInteraction() {
    _timer?.cancel();
    _timer =
        Timer(const Duration(seconds: 2, milliseconds: 500), _startAutoScroll);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive values
    final carouselHeight = screenHeight * 0.15;
    final horizontalPadding = screenWidth * 0.04;
    final borderRadius = screenWidth * 0.05;

    return GestureDetector(
      onTapDown: (_) => _handleUserInteraction(),
      onHorizontalDragStart: (_) => _handleUserInteraction(),
      child: Container(
        color: const Color(0xFFF5F5F5),
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        child: Column(
          children: [
            SizedBox(
              height: carouselHeight,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _handlePageChanged,
                itemCount: carouselItems.length,
                itemBuilder: (context, index) {
                  return _buildCarouselItem(
                      context, carouselItems[index], index);
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            _buildIndicators(screenWidth),
            SizedBox(height: screenHeight * 0.01),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicators(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        carouselItems.length,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.008),
          width: screenWidth * 0.015,
          height: screenWidth * 0.015,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.blue : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, CarouselItem item, int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
      ),
      padding: EdgeInsets.all(screenWidth * 0.045),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hiremi ',
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '360',
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Career ka backup,',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'Success ka gaurantee',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Image.asset(
              AppImages.careerImage,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselItem {
  final String title;
  final String subtitle;
  final String imagePath;
  final List<Color> gradientColors;

  CarouselItem({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.gradientColors,
  });
}
