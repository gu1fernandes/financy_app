import 'package:financy_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Align(
          child: Column(
            children: [
              SizedBox(height: 60.0),
              Expanded(
                flex: 2,
                child: Container(
                  color: AppColors.iceWhite,
                  child: Image.asset('assets/images/man.png'),
                ),
              ),
              Text(
                'Gaste com inteligência',
                style: AppTextStyles.mediumText.copyWith(
                  color: AppColors.greenlightTwo,
                ),
              ),
              Text(
                'Economize mais',
                style: AppTextStyles.mediumText.copyWith(
                  color: AppColors.greenlightTwo,
                ),
              ),
              const SizedBox(height: 16.0),
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 56.0,
                  width: 150.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppColors.greenGradient,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(38.0)),
                  ),
                  child: Text(
                    'Criar Conta',
                    style: AppTextStyles.mediumText.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Já possui uma conta? Log In',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.greydark,
                ),
              ),
              SizedBox(height: 60.0),
            ],
          ),
        ),
      ),
    );
  }
}
