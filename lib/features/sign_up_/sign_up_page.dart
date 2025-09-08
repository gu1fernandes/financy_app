import 'dart:developer';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/constants.dart';
import 'package:financy_app/common/utils/uppercase_text_formatter.dart';
import 'package:financy_app/common/utils/validator.dart';
import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(height: 30.0),
            Text(
              'Comece a usar',
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText36.copyWith(
                color: AppColors.greenlightTwo,
              ),
            ),
            Text(
              'o seu dinheiro!',
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText36.copyWith(
                color: AppColors.greenlightTwo,
              ),
            ),
            SizedBox(
              width: 480,
              height: 180,
              child: Image.asset('assets/images/sign_up.png'),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: 'seu nome',
                    hintText: 'Ex:Gerônimo Belchior Aguiar',
                    inputFormatters: [UppercaseTextFormatter()],
                    validator: Validator.validateName,
                  ),
                  CustomTextFormField(
                    labelText: 'seu email',
                    hintText: 'Ex:geronimo@email.com',
                    inputFormatters: [UppercaseTextFormatter()],
                    validator: Validator.validateEmail,
                  ),
                  PasswordFormField(
                    controller: _passwordController,
                    labelText: 'digite sua senha',
                    hintText: 'Ex:Senha123!',
                    validator: Validator.validatePassword,
                    helperText:
                        "A senha deve ter no mínimo 8 caracteres, incluindo letras maiúsculas, minúsculas e números.",
                  ),
                  PasswordFormField(
                    labelText: 'confirme sua senha',
                    hintText: 'Ex:Senha123!',
                    validator: (value) => Validator.validateConfirmPassword(
                      value,
                      _passwordController.text,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
                top: 16.0,
                bottom: 4.0,
              ),
              child: PrimaryButton(
                text: 'Criar Conta',
                onPressed: () {
                  final valid =
                      _formKey.currentState != null &&
                      _formKey.currentState!.validate();
                  if (valid) {
                    log("continuar a lógica de criação de conta");
                  } else {
                    log("erro de login");
                  }
                },
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

  String? validateName(value) {
    if (value != null && value.isEmpty) {
      return 'Por favor, insira seu nome';
    }
    return null;
  }
}
