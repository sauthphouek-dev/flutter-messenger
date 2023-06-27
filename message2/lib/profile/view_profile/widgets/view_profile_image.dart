import 'package:flutter/material.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:photo_view/photo_view.dart';

class ProfileImagePreview extends StatelessWidget {
  const ProfileImagePreview({super.key});

  static const routePath = '/profile/image/preview';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(.8),
        body: Stack(
          children: [
            Positioned(
              top: 10,
              left: 8,
              child: Container(
                padding: const EdgeInsets.all(AppFontSize.sm),
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
                    Icons.close,
                    color: AppColors.blackColor.withOpacity(.6),
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .3,
                child: PhotoView(
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  imageProvider: const AssetImage('assets/images/sticker.webp'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
