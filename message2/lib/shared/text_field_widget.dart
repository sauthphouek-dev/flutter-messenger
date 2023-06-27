import 'package:flutter/material.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';
import 'package:message2/app_data/box_shadow.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.isShowPassword = false,
    this.onTap,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool isShowPassword;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // text form field with background color grey, no border, border radius 16
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.06),
        borderRadius: BorderRadius.circular(AppFontSize.sm),
        // boxShadow: CardBoxShadow.primaryShadow,
      ),
      child: TextFormField(
        obscureText: isShowPassword,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: obscureText
              ? IconButton(
                  splashRadius: AppFontSize.xlg,
                  onPressed: onTap,
                  icon: Icon(
                    isShowPassword
                        ? Icons.remove_red_eye
                        : Icons.visibility_off,
                    color: AppColors.greyColor,
                  ),
                )
              : null,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: AppFontSize.md,
            color: Colors.grey,
            fontWeight: AppFontWeight.light,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppFontSize.lg,
            vertical: AppFontSize.xlg,
          ),
        ),
      ),
    );
  }
}
