import 'package:flutter/material.dart';
import 'package:message2/app_data/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        width: 72,
        height: 72,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(.2),
          shape: BoxShape.circle,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.blackColor.withOpacity(.6),
          ),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
