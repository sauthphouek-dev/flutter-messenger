import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/shared/elevated_button_widget.dart';

void signInSuccessDialog(BuildContext context) {
  showAnimatedDialog(
    context: context,
    animationType: DialogTransitionType.fadeScale,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppFontSize.lg),
        ),
        backgroundColor: Colors.grey.shade200,
        actionsPadding: const EdgeInsets.all(AppFontSize.xlg),
        title: Lottie.asset(
          'assets/lottie/topup_success.json',
          width: 140,
          height: 140,
        ),
        content: Text(
          'You have logged in successfully',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.xxlg,
              ),
        ),
        actions: [
          ElevatedButtonWidget(
            title: 'Continue',
            onPressed: () {
              context.pop();
              GoRouter.of(context).pushReplacement('/login');
            },
          )
        ],
      );
    },
  );
}
