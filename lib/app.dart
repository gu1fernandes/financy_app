import 'package:financy_app/features/onboarding/onboarding_page.dart';
import 'package:financy_app/features/splashes/splash_page.dart';
import 'package:flutter/material.dart';

class FinancyApp extends StatelessWidget {
  const FinancyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}
