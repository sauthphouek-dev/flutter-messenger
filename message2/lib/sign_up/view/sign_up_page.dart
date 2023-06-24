import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';
import 'package:message2/login/widget/sign_in_with_email.dart';
import 'package:message2/shared/continue_with_facebook.dart';
import 'package:message2/shared/continue_with_google.dart';
import 'package:message2/shared/elevated_button_widget.dart';
import 'package:message2/shared/or_continue_with.dart';
import 'package:message2/shared/text_field_widget.dart';
import 'package:message2/sign_up/sign_up.dart';
import 'package:message2/sign_up/sign_up_with_email/sign_up_with_email.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const String routePath = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(),
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: GestureDetector(
            onTap: closeKeyboard,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: AppColors.primaryColor,
                  iconTheme: IconThemeData(color: AppColors.whiteColor),
                  expandedHeight: 160,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: AppColors.primaryColor,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: AppFontSize.xxlg,
                              fontWeight: AppFontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const SizedBox(height: AppFontSize.md),
                          Text(
                            'Create your new account to continue',
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
                                  SignUpWithEmailPage.routePath,
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
                                  'Already have an account?',
                                  style: TextStyle(
                                    fontSize: AppFontSize.lg,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    GoRouter.of(context)
                                        .push(SignInWithEmail.routePath);
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: AppFontSize.lg,
                                      fontWeight: AppFontWeight.semiBold,
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
