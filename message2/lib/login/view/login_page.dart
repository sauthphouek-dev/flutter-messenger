import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';

import 'package:message2/login/login.dart';
import 'package:message2/login/widget/sign_in_with_email.dart';
import 'package:message2/shared/continue_with_facebook.dart';
import 'package:message2/shared/continue_with_google.dart';
import 'package:message2/shared/elevated_button_widget.dart';
import 'package:message2/shared/or_continue_with.dart';
import 'package:message2/shared/text_field_widget.dart';
import 'package:message2/sign_up/sign_up.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routePath = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController _emailController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  bool get isOpened => MediaQuery.of(context).viewInsets.bottom != 0;

  void closeKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: GestureDetector(
            onTap: closeKeyboard,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: AppColors.primaryColor,
                  expandedHeight: 160,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: AppColors.primaryColor,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hi, Welcome Back!',
                            style: TextStyle(
                              fontSize: AppFontSize.xxlg,
                              fontWeight: AppFontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const SizedBox(height: AppFontSize.md),
                          Text(
                            'Login to your account to continue',
                            style: TextStyle(
                              fontSize: AppFontSize.lg,
                              fontWeight: AppFontWeight.medium,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  fillOverscroll: true,
                  child: DecoratedBox(
                    // color white
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppFontSize.xxlg),
                        topRight: Radius.circular(AppFontSize.xxlg),
                      ),
                    ),
                    child: Form(
                      child: Padding(
                        padding: const EdgeInsets.all(AppFontSize.lg),
                        child: Column(
                          //start
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: AppFontSize.lg),
                            // email label
                            Text(
                              'Email',
                              style: TextStyle(
                                fontSize: AppFontSize.lg,
                                color: AppColors.greyColor,
                              ),
                            ),
                            const SizedBox(height: AppFontSize.md),
                            TextFieldWidget(
                              controller: _emailController,
                              hintText: 'Enter your email address',
                            ),
                            const SizedBox(height: AppFontSize.xxxlg),
                            ElevatedButtonWidget(
                              title: 'Continue with Email',
                              onPressed: () {
                                GoRouter.of(context).push(
                                  SignInWithEmail.routePath,
                                );
                              },
                            ),
                            // -------------or continue with--------
                            const SizedBox(height: AppFontSize.xxxlg),
                            const OrContinueWith(),

                            // continue with Google with icon
                            const SizedBox(height: AppFontSize.xxxlg),
                            const ContinueWithGoogle(),
                            // continue with Apple with icon
                            const SizedBox(height: AppFontSize.lg),
                            const ContinueWithFacebook(),
                            const SizedBox(height: AppFontSize.xxxlg),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    fontSize: AppFontSize.lg,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    GoRouter.of(context).pushReplacement(
                                      SignUpPage.routePath,
                                    );
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: AppFontSize.lg,
                                      fontWeight: AppFontWeight.medium,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
