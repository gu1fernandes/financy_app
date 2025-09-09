import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/features/onboarding/onboarding_page.dart';
import 'package:financy_app/features/sign_up_/sign_up_page.dart';
import 'package:financy_app/features/splashes/splash_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Financy App',
      initialRoute: NamedRoute.initial,
      routes: {
        NamedRoute.initial: (context) => const OnboardingPage(),
        NamedRoute.splash: (context) => const SplashPage(),
        NamedRoute.signUp: (context) => const SignUpPage(),
        //NamedRoute.signIn: (context) => const SignInPage(),
      },
    );
  }
}
