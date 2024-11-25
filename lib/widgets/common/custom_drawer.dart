import 'package:flutter/material.dart';
import 'logout_dialog.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: width * 0.02,
          ),
          child: Column(
            children: [
              // Profile Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: width * 0.12,
                        height: width * 0.12,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: 0.25,
                              backgroundColor: const Color(0xFFEEF2FF),
                              color: const Color.fromARGB(255, 36, 231, 33),
                              strokeWidth: width * 0.015,
                            ),
                            Text(
                              '25%',
                              style: TextStyle(
                                fontSize: width * 0.032,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 36, 231, 33),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: width * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Harsh Pawar',
                            style: TextStyle(
                              fontSize: width * 0.042,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1F1F1F),
                            ),
                          ),
                          Text(
                            'harshPawa@gmail.com',
                            style: TextStyle(
                              fontSize: width * 0.032,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      size: width * 0.06,
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.025),

              // Premium Card
              Container(
                padding: EdgeInsets.all(width * 0.04),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F3CC9),
                  borderRadius: BorderRadius.circular(width * 0.03),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'HireMi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: width * 0.02),
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.02,
                            vertical: width * 0.004,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 212, 176, 18),
                            borderRadius: BorderRadius.circular(width * 0.01),
                          ),
                          child: Text(
                            'Get Verified',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.024,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      'Verify your profile to unlock premium\nfeatures and lifetime benefits.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.032,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(height: height * 0.008),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(width * 0.01),
                      ),
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Complete your profile & Get Started',
                          style: TextStyle(
                            color: const Color(0xFF0F3CC9),
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.025),

              // Menu Items with light background
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(width * 0.02),
                ),
                child: _buildMenuItem(context, Icons.menu, 'Settings'),
              ),
              SizedBox(height: height * 0.015),
              _buildMenuItem(context, Icons.lock, 'Change Password'),
              SizedBox(height: height * 0.015),
              _buildMenuItem(context, Icons.paste, 'About App'),
              SizedBox(height: height * 0.015),
              _buildMenuItem(context, Icons.info, 'Help & Support'),

              const Spacer(),

              // Logout Button
              _buildMenuItem(
                context,
                Icons.logout,
                'Log out',
                isLogout: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title,
      {bool isLogout = false}) {
    final width = MediaQuery.of(context).size.width;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: width * 0.005,
      ),
      leading: Icon(
        icon,
        size: width * 0.055,
        color: isLogout ? const Color(0xFFDC2626) : const Color(0xFF0F3CC9),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: width * 0.036,
          color: isLogout ? const Color(0xFFDC2626) : const Color(0xFF1F1F1F),
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: isLogout
          ? null
          : Icon(
              Icons.chevron_right,
              size: width * 0.06,
              color: const Color(0xFF6B7280),
            ),
      onTap: () async {
        if (isLogout) {
          Navigator.pop(context); // Close drawer first
          final shouldLogout = await showDialog<bool>(
            context: context,
            barrierColor: Colors.black.withOpacity(0.5), // Darker overlay
            builder: (context) => const LogoutDialog(),
          );

          if (shouldLogout == true) {
            // Handle logout
            print('Performing logout...');
          }
        } else {
          switch (title) {
            case 'Settings':
              print('Settings tapped');
              break;
            case 'Change Password':
              print('Change Password tapped');
              break;
            case 'About App':
              print('About App tapped');
              break;
            case 'Help & Support':
              print('Help & Support tapped');
              break;
          }
        }
      },
    );
  }
}
