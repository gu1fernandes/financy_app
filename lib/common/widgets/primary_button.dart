import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const PrimaryButton({Key? key, this.onPressed, required this.text})
    : super(key: key);

  final BorderRadius _borderRadius = const BorderRadius.all(
    Radius.circular(36.0),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        height: 67.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: onPressed != null
                ? AppColors.greenGradient
                : AppColors.greyGradient,
          ),
        ),
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: AppTextStyles.mediumText.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
