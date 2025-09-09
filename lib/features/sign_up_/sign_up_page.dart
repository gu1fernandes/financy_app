import 'dart:developer';
import 'package:financy_app/features/sign_up_/sign_up_controller.dart';
import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/constants.dart';
import 'package:financy_app/common/utils/uppercase_text_formatter.dart';
import 'package:financy_app/common/utils/validator.dart';
import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:financy_app/common/widgets/multi_text_button.dart';
import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:financy_app/features/sign_up_/sign_up_state.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _controller = SignUpController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      log(_controller.state.toString());
      if (_controller.state is SignUpLoadingState) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(child: CircularProgressIndicator()),
        );
      }

      if (_controller.state is SignUpSuccessState) {
        // Hide loading indicator

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const Scaffold(body: Center(child: Text("new page"))),
          ),
        );
      }
      if (_controller.state is SignUpErrorState) {
        // Hide loading indicator
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Erro'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

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
                    _controller.doSignUp();
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
