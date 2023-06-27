import 'package:flutter/material.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';

class CardListTileSwitcher extends StatelessWidget {
  const CardListTileSwitcher({
    super.key,
    required this.title,
    required this.sectionType,
    required this.onChange,
  });

  final String title;
  final bool sectionType;
  final void Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: AppFontWeight.semiBold,
            fontSize: AppFontSize.xlg,
            color: Colors.grey.shade900,
          ),
        ),
        Switch.adaptive(
          activeColor: AppColors.primaryColor,
          activeTrackColor: AppColors.primaryColor,
          inactiveThumbColor: AppColors.whiteColor,
          inactiveTrackColor: AppColors.greyColor.withOpacity(.2),
          value: sectionType,
          onChanged: onChange,
        ),
      ],
    );
  }
}
