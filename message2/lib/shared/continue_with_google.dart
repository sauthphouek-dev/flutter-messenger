import 'package:flutter/material.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';
import 'package:message2/app_data/box_shadow.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ContinueWithGoogle extends StatelessWidget {
  const ContinueWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppFontSize.sm),
        boxShadow: CardBoxShadow.primaryShadow,
        color: Colors.grey.shade200,
      ),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(
          PhosphorIcons.duotone.googleLogo,
          color: AppColors.blackColor,
        ),
        label: Text(
          'Continue with Google',
          style: TextStyle(
            fontSize: AppFontSize.lg,
            fontWeight: AppFontWeight.semiBold,
            color: AppColors.blackColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppFontSize.sm),
            side: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
