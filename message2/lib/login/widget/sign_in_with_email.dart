import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';
import 'package:message2/forgot_password/verify_email/verify_email.dart';
import 'package:message2/shared/continue_with_facebook.dart';
import 'package:message2/shared/continue_with_google.dart';
import 'package:message2/shared/elevated_button_widget.dart';
import 'package:message2/shared/or_continue_with.dart';
import 'package:message2/shared/sign_in_success_dialog.dart';
import 'package:message2/shared/text_field_widget.dart';
import 'package:message2/sign_up/sign_up.dart';

class SignInWithEmail extends StatefulWidget {
  const SignInWithEmail({super.key});

  static const routePath = '/sign_in_with_email';

  @override
  State<SignInWithEmail> createState() => _SignInWithEmailState();
}

class _SignInWithEmailState extends State<SignInWithEmail> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool isShowPassword = false;
  bool isRememberMe = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      extendBody: true,
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
        title: Text(
          'Sign In',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppFontSize.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),

                    // email field
                    Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: AppFontSize.lg,
                        color: AppColors.greyColor,
                        fontWeight: AppFontWeight.medium,
                      ),
                    ),
                    const SizedBox(height: AppFontSize.xxs),
                    TextFieldWidget(
                      controller: _emailController,
                      hintText: 'Enter your email address',
                    ),
                    const SizedBox(height: AppFontSize.md),
                    // password field
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: AppFontSize.lg,
                        color: AppColors.greyColor,
                        fontWeight: AppFontWeight.medium,
                      ),
                    ),
                    const SizedBox(height: AppFontSize.xxs),
                    TextFieldWidget(
                      controller: _passwordController,
                      hintText: 'Enter your password',
                      obscureText: true,
                      isShowPassword: isShowPassword,
                      onTap: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                    ),
                    Row(
                      children: [
                        // remember me with radio
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isRememberMe = !isRememberMe;
                            });
                          },
                          child: Row(
                            children: [
                              Checkbox(
                                value: isRememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    isRememberMe = value!;
                                  });
                                },
                                activeColor: AppColors.primaryColor,
                                checkColor: AppColors.whiteColor,
                              ),
                              Text(
                                'Remember me',
                                style: TextStyle(
                                  fontSize: AppFontSize.lg,
                                  fontWeight: AppFontWeight.light,
                                  color: AppColors.greyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context)
                                .push(VerifyEmailPage.routePath);
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: AppFontSize.md,
                              fontWeight: AppFontWeight.medium,
                              color: AppColors.redColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppFontSize.xxlg),
                    ElevatedButtonWidget(
                      title: 'Sign In',
                      onPressed: () {
                        signInSuccessDialog(context);
                      },
                    ),

                    const SizedBox(height: AppFontSize.xxxlg),
                    const OrContinueWith(),
                    const SizedBox(height: AppFontSize.xxxlg),
                    const ContinueWithGoogle(),
                    const SizedBox(height: AppFontSize.lg),
                    const ContinueWithFacebook(),
                    const SizedBox(height: AppFontSize.xxxlg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context)
                                .pushReplacement(SignUpPage.routePath);
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: AppFontSize.md,
                              fontWeight: AppFontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
