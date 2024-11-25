import 'package:flutter/material.dart';

class AppImages {
  // Base path for assets
  static const String _basePath = 'lib/assets';

  // Image paths
  static const String askExpert = '$_basePath/Ask expert.png';
  static const String careerImage = '$_basePath/careerimg.png';
  static const String experience = '$_basePath/experience.png';
  static const String freshers = '$_basePath/freshers.png';
  static const String internship = '$_basePath/intership.png';
  static const String status = '$_basePath/status.png';
  static const String hiremi360 = '$_basePath/Frame 427318920.png';
  static const String growthChart = '$_basePath/growth_chart.png';
  static const String notificationEmpty = '$_basePath/notification_empty.png';
}

class AppColors {
  // Ask Expert Card Colors (Soft Blue)
  static const List<Color> askExpertGradient = [
    Color(0xFF9CCAFF), // Darker saturated blue
    Colors.white,
    Color(0xFFCCE4FF), // Darker light blue
  ];

  // Internship Card Colors (Soft Green)
  static const List<Color> internshipGradient = [
    Color(0xFF8DDDB8), // Darker saturated mint
    Colors.white,
    Color(0xFFCCEEDE), // Darker light mint
  ];

  // Status Card Colors (Soft Pink)
  static const List<Color> statusGradient = [
    Color(0xFFFFAAAA), // Darker saturated pink
    Colors.white,
    Color(0xFFFFD6D6), // Darker light pink
  ];

  // Freshers Card Colors (Soft Orange)
  static const List<Color> freshersGradient = [
    Color(0xFFFFBB8E), // Darker saturated orange
    Colors.white,
    Color(0xFFFFE1D1), // Darker light orange
  ];

  // Hiremi 360 Card Colors (Soft Yellow)
  static const List<Color> hiremi360Gradient = [
    Color(0xFFFFDB8E), // Darker saturated yellow
    Colors.white,
    Color(0xFFFFEED1), // Darker light yellow
  ];

  // Experience Card Colors (Soft Purple)
  static const List<Color> experienceGradient = [
    Color(0xFFC4A6FF), // Darker saturated purple
    Colors.white,
    Color(0xFFE6D9FF), // Darker light purple
  ];
}
