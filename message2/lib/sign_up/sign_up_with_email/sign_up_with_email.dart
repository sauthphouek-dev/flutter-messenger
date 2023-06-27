import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';
import 'package:message2/login/widget/sign_in_with_email.dart';
import 'package:message2/shared/custom_app_bar.dart';
import 'package:message2/shared/elevated_button_widget.dart';
import 'package:message2/shared/text_field_widget.dart';

class SignUpWithEmailPage extends StatefulWidget {
  const SignUpWithEmailPage({super.key});

  static const String routePath = '/sign-up-with-email';

  @override
  State<SignUpWithEmailPage> createState() => _SignUpWithEmailPageState();
}

class _SignUpWithEmailPageState extends State<SignUpWithEmailPage> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  bool isShowPassword = false;
  bool isShowConfirmPassword = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const CustomAppBar(
        title: 'Sign Up',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Complete your account',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Sign up with your email address',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: AppFontSize.xxxlg),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // first name field
                    Text(
                      'First Name',
                      style: TextStyle(
                        fontSize: AppFontSize.lg,
                        color: AppColors.greyColor,
                        fontWeight: AppFontWeight.medium,
                      ),
                    ),
                    const SizedBox(height: AppFontSize.xxs),
                    TextFieldWidget(
                      controller: _firstNameController,
                      hintText: 'Enter your first name',
                    ),

                    // last name field
                    const SizedBox(height: AppFontSize.md),
                    Text(
                      'Last Name',
                      style: TextStyle(
                        fontSize: AppFontSize.lg,
                        color: AppColors.greyColor,
                        fontWeight: AppFontWeight.medium,
                      ),
                    ),
                    const SizedBox(height: AppFontSize.xxs),
                    TextFieldWidget(
                      controller: _lastNameController,
                      hintText: 'Enter your last name',
                    ),

                    const SizedBox(height: AppFontSize.md),
                    Text(
                      'E-mail',
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
                    const SizedBox(height: AppFontSize.md),
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
                      controller: _confirmPasswordController,
                      hintText: 'Enter your password',
                      obscureText: true,
                      isShowPassword: isShowConfirmPassword,
                      onTap: () {
                        setState(() {
                          isShowConfirmPassword = !isShowConfirmPassword;
                        });
                      },
                    ),
                    const SizedBox(height: AppFontSize.xxlg),
                    ElevatedButtonWidget(
                      title: 'Continue with Email',
                      onPressed: () {},
                    ),
                    const SizedBox(height: AppFontSize.xlg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context)
                                .pushReplacement(SignInWithEmail.routePath);
                          },
                          child: Text(
                            'Login',
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
