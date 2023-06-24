import 'package:flutter/material.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';
import 'package:message2/app_data/box_shadow.dart';
import 'package:message2/shared/text_field_widget.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  static const String routePath = '/create-new-password';

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  bool get isOpened => MediaQuery.of(context).viewInsets.bottom != 0;

  void closeKeyboard() {
    if (isOpened) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: Container(
          width: 72,
          height: 72,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            color: AppColors.greyColor.withOpacity(.2),
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
      ),
      body: GestureDetector(
        onTap: closeKeyboard,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppFontSize.md),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: AppFontSize.xlg),
                Text(
                  'Create New Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: AppFontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: AppFontSize.xs),
                Text(
                  'Enter your new password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: AppFontWeight.regular,
                    color: AppColors.blackColor.withOpacity(.6),
                  ),
                ),
                const SizedBox(height: AppFontSize.xxxlg),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppFontSize.xxlg),
                      Text(
                        'New Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: AppFontWeight.medium,
                          color: AppColors.blackColor.withOpacity(.4),
                        ),
                      ),
                      const SizedBox(height: AppFontSize.xs),
                      TextFieldWidget(
                        controller: _passwordController,
                        hintText: 'Enter your new password',
                        obscureText: true,
                        isShowPassword: isPasswordVisible,
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      const SizedBox(height: AppFontSize.xxxlg),
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: AppFontWeight.medium,
                          color: AppColors.blackColor.withOpacity(.4),
                        ),
                      ),
                      const SizedBox(height: AppFontSize.xs),
                      TextFieldWidget(
                        controller: _confirmPasswordController,
                        hintText: 'Confirm your password',
                        obscureText: true,
                        isShowPassword: isConfirmPasswordVisible,
                        onTap: () {
                          setState(() {
                            isConfirmPasswordVisible =
                                !isConfirmPasswordVisible;
                          });
                        },
                      ),
                      const SizedBox(height: AppFontSize.xxxlg),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppFontSize.md),
                          boxShadow: CardBoxShadow.primaryShadow,
                        ),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppFontSize.xlg),
                            ),
                          ),
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
