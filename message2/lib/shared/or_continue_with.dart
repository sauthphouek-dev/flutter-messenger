import 'package:flutter/material.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';

class OrContinueWith extends StatelessWidget {
  const OrContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 64,
          child: Divider(
            color: AppColors.blackColor,
            height: 1,
          ),
        ),
        const SizedBox(width: AppFontSize.md),
        Text(
          'Or continue with',
          style: TextStyle(
            fontSize: AppFontSize.md,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(width: AppFontSize.md),
        SizedBox(
          width: 64,
          child: Divider(
            color: AppColors.blackColor,
            height: 1,
          ),
        ),
      ],
    );
  }
}
