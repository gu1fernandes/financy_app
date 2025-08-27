import 'package:financy_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 60.0),
            Expanded(
              flex: 2,
              child: Container(
                color: AppColors.iceWhite,
                child: Image.asset('assets/images/man.png'),
              ),
            ),
            const Text(
              'Gaste com inteligência',
              style: AppTextStyles.mediumText,
            ),
            const Text('Economize mais', style: AppTextStyles.mediumText),
          ],
        ),
      ),
    );
  }
}
