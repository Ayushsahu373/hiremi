import 'package:flutter/material.dart';
import 'package:hiremi_dashboard/constants/constants.dart';
import 'package:hiremi_dashboard/widgets/common/unlock_benefits_modal.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Calculate responsive sizes
    final titleSize = size.width * 0.045;
    final subtitleSize = size.width * 0.035;
    final cardTitleSize = size.width * 0.032;
    final cardSubtitleSize = size.width * 0.025;

    // Grid properties
    final padding = size.width * 0.04;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: padding,
            bottom: padding * 0.5,
          ),
          child: Text(
            "Hiremi's Featured",
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 2.0,
          padding: EdgeInsets.symmetric(
            horizontal: padding,
            vertical: padding * 0.5,
          ),
          mainAxisSpacing: padding * 0.75,
          crossAxisSpacing: padding * 0.75,
          children: [
            FeatureCard(
              title: 'Ask Expert',
              subtitle: 'Ask Anything Get\nExpert Guidance',
              imagePath: AppImages.askExpert,
              gradientColors: AppColors.askExpertGradient,
              titleSize: cardTitleSize,
              subtitleSize: cardSubtitleSize,
              onTap: () => Navigator.pushNamed(context, '/ask-expert'),
            ),
            FeatureCard(
              title: 'Internship',
              subtitle: 'Gain Practical\nExperience',
              imagePath: AppImages.internship,
              gradientColors: AppColors.internshipGradient,
              titleSize: cardTitleSize,
              subtitleSize: cardSubtitleSize,
              onTap: () => Navigator.pushNamed(context, '/internship'),
            ),
            FeatureCard(
              title: 'Status',
              subtitle: 'Apply Mentorship\n& more',
              imagePath: AppImages.status,
              gradientColors: AppColors.statusGradient,
              titleSize: cardTitleSize,
              subtitleSize: cardSubtitleSize,
              onTap: () => Navigator.pushNamed(context, '/status'),
            ),
            FeatureCard(
              title: 'Freshers',
              subtitle: 'Gain Practical\nExperience',
              imagePath: AppImages.freshers,
              gradientColors: AppColors.freshersGradient,
              titleSize: cardTitleSize,
              subtitleSize: cardSubtitleSize,
              onTap: () => Navigator.pushNamed(context, '/freshers'),
            ),
            FeatureCard(
              title: 'Hiremi 360',
              subtitle: 'Gain Practical\nExperience',
              imagePath: AppImages.hiremi360,
              gradientColors: AppColors.hiremi360Gradient,
              titleSize: cardTitleSize,
              subtitleSize: cardSubtitleSize,
              onTap: () => Navigator.pushNamed(context, '/hiremi360'),
            ),
            FeatureCard(
              title: 'Experience',
              subtitle: 'Explore diverse\ncareers',
              imagePath: AppImages.experience,
              gradientColors: AppColors.experienceGradient,
              titleSize: cardTitleSize,
              subtitleSize: cardSubtitleSize,
              onTap: () => Navigator.pushNamed(context, '/experience'),
            ),
          ],
        ),
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final List<Color> gradientColors;
  final VoidCallback onTap;
  final double titleSize;
  final double subtitleSize;

  const FeatureCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.gradientColors,
    required this.onTap,
    required this.titleSize,
    required this.subtitleSize,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Calculate responsive sizes
    final imageHeight = size.width * 0.18; // Increased image size
    final imagePadding = size.width * 0.04;

    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => UnlockBenefitsModal(
            onClose: () => Navigator.pop(context),
          ),
        );
      },
      borderRadius: BorderRadius.circular(size.width * 0.03),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: imagePadding,
          vertical: imagePadding * 0.75,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            stops: const [0.4, 0.8, 0.9],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(size.width * 0.03),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: titleSize,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: size.width * 0.01),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: subtitleSize,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.asset(
                imagePath,
                height: imageHeight,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
