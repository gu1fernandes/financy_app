import 'dart:developer';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/constants.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Text(
              'Gaste com inteligência',
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.greenlightOne,
              ),
            ),
            Text(
              'Economize mais',
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.greenlightOne,
              ),
            ),
            Image.asset('assets/images/sign_up.png'),
            TextFormField(),
            const TextField(),
            Padding(
              padding: const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
                top: 16.0,
                bottom: 4.0,
              ),
              child: PrimaryButton(
                text: 'Criar Conta',
                onPressed: () => log('tap'),
              ),
            ),
            MultiTextButton(
              onPressed: () => log('tap'),
              children: [
                Text(
                  'Já possui uma conta? ',
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                Text(
                  'Entrar ',
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.greenlightOne,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
