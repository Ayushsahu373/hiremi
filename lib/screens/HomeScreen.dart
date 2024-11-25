import 'package:flutter/material.dart';
import 'package:hiremi_dashboard/screens/jobs_screen.dart';
import 'package:hiremi_dashboard/screens/ask_expert_screen.dart';
import 'package:hiremi_dashboard/screens/status_screen.dart';
import 'package:hiremi_dashboard/screens/hiremi360_screen.dart';
import 'package:hiremi_dashboard/widgets/common/custom_app_bar.dart';
import 'package:hiremi_dashboard/widgets/common/custom_bottom_nav_bar.dart';
import 'package:hiremi_dashboard/widgets/common/custom_drawer.dart';
import 'package:hiremi_dashboard/widgets/home/carousel_section.dart';
import 'package:hiremi_dashboard/widgets/home/featured_grid.dart';
import 'package:hiremi_dashboard/widgets/home/jobs_for_you_section.dart';
import 'package:hiremi_dashboard/widgets/home/verification_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    // Home Screen Content
    SingleChildScrollView(
      child: Column(
        children: const [
          VerificationSection(),
          CarouselSection(),
          FeaturedSection(),
          JobsForYouSection(),
        ],
      ),
    ),
    // Other Screens
    const JobsScreen(),
    const AskExpertScreen(),
    const StatusScreen(),
    const Hiremi360Screen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
