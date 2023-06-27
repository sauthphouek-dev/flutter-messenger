import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';
import 'package:message2/app_data/box_shadow.dart';
import 'package:message2/forgot_password/create_password/view/create_new_password.dart';
import 'package:message2/shared/custom_app_bar.dart';
import 'package:message2/shared/elevated_button_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  static const String routePath = '/verify-otp';

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  bool get isOpened => MediaQuery.of(context).viewInsets.bottom != 0;

  void closeKeyboard() {
    if (isOpened) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: '',
      ),
      body: GestureDetector(
        onTap: closeKeyboard,
        child: Padding(
          padding: const EdgeInsets.all(AppFontSize.md),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Enter OPT',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor.withOpacity(.8),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  textAlign: TextAlign.center,
                  'We have just send you 4 digit code via your email',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor.withOpacity(.6),
                  ),
                ),
                const SizedBox(height: AppFontSize.xxxlg),
                // generate 4 text field to enter OTP
                Padding(
                  padding: const EdgeInsets.all(AppFontSize.lg),
                  child: PinCodeTextField(
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    animationCurve: Curves.linear,
                    appContext: context,
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor.withOpacity(.8),
                    ),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(AppFontSize.xlg),
                      fieldHeight: 64,
                      fieldWidth: 64,
                      activeFillColor: AppColors.greyColor.withOpacity(.2),
                      inactiveFillColor: AppColors.greyColor.withOpacity(.2),
                      activeColor: AppColors.primaryColor,
                      inactiveColor: AppColors.greyColor.withOpacity(.2),
                      selectedColor: AppColors.primaryColor,
                      selectedFillColor: AppColors.greyColor.withOpacity(.2),
                    ),
                    length: 4,
                    onChanged: (value) {},
                    onCompleted: (value) {
                      GoRouter.of(context).push(CreateNewPassword.routePath);
                    },
                    cursorColor: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: AppFontSize.xxxlg),

                // button to verify OTP
                ElevatedButtonWidget(
                  title: 'Continue',
                  onPressed: () {
                    GoRouter.of(context).push(CreateNewPassword.routePath);
                  },
                ),
                // Didn't receive OTP? Resend Code
                const SizedBox(height: AppFontSize.xxlg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive code? ",
                      style: TextStyle(
                        fontSize: AppFontSize.xlg,
                        fontWeight: AppFontWeight.medium,
                        color: AppColors.greyColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
