import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:hiremi_dashboard/constants/constants.dart';

class UnlockBenefitsModal extends StatelessWidget {
  final VoidCallback onClose;

  const UnlockBenefitsModal({
    super.key,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final modalWidth = width * 0.75;
    final basePadding = width * 0.04;
    final smallPadding = width * 0.02;

    return Stack(
      children: [
        // Blurred Background
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            width: width,
            height: height,
            color: Colors.transparent,
          ),
        ),

        Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: Container(
            width: modalWidth,
            margin: EdgeInsets.symmetric(horizontal: basePadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(width * 0.04),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  blurRadius: width * 0.096,
                  offset: Offset(0, height * 0.01),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(basePadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'IMPORTANT',
                            style: TextStyle(
                              color: const Color(0xFF0F3CC9),
                              fontSize: width * 0.032,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: smallPadding),
                          Container(
                            width: width * 0.04,
                            height: width * 0.04,
                            decoration: const BoxDecoration(
                              color: Color(0xFF0F3CC9),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.priority_high,
                              color: Colors.white,
                              size: width * 0.028,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: onClose,
                        child: Container(
                          padding: EdgeInsets.all(smallPadding),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                          child: Icon(
                            Icons.close,
                            size: width * 0.04,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  AppImages.growthChart,
                  height: height * 0.14,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: smallPadding),
                Text(
                  'Unlock Exclusive Benefits',
                  style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: smallPadding),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: basePadding),
                  padding: EdgeInsets.symmetric(
                    vertical: smallPadding,
                    horizontal: basePadding,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F3CC9).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(width * 0.02),
                  ),
                  child: Text(
                    'Verify now for exclusive lifetime Perks',
                    style: TextStyle(
                      color: const Color(0xFF0F3CC9),
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: smallPadding * 1.5),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '₹2999 ',
                        style: TextStyle(
                          color: const Color(0xFF0F3CC9),
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'for Lifetime Access',
                        style: TextStyle(
                          color: const Color(0xFF0F3CC9),
                          fontSize: width * 0.035,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '(One-time verification fee)',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: width * 0.03,
                  ),
                ),
                SizedBox(height: smallPadding),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: basePadding),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Note: ',
                          style: TextStyle(
                            color: const Color(0xFF0F3CC9),
                            fontWeight: FontWeight.w500,
                            fontSize: width * 0.028,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Verification is required for special content access.',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: width * 0.028,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(basePadding),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0F3CC9),
                      minimumSize: Size(modalWidth * 0.85, height * 0.06),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.02),
                      ),
                    ),
                    child: Text(
                      'Verify & Unlock Now',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
