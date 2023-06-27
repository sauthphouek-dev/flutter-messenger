// GoRouter configuration
// GoRouter is a declarative router for Flutter.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:message2/app/view/main_view.dart';
import 'package:message2/chat/chat.dart';
import 'package:message2/forgot_password/create_password/view/create_new_password.dart';
import 'package:message2/forgot_password/verify_email/verify_email.dart';
import 'package:message2/forgot_password/verify_otp/view/verify_otp_page.dart';
import 'package:message2/home/view/home_page.dart';
import 'package:message2/login/login.dart';
import 'package:message2/login/widget/sign_in_with_email.dart';
import 'package:message2/notification/view/notification_page.dart';
import 'package:message2/profile/security/security.dart';
import 'package:message2/profile/view/profile_page.dart';
import 'package:message2/profile/view_profile/view/view.dart';
import 'package:message2/profile/view_profile/widgets/view_profile_image.dart';
import 'package:message2/profile/widget/change_password.dart';
import 'package:message2/profile/widget/legal_&_policy.dart';
import 'package:message2/sign_up/sign_up.dart';
import 'package:message2/sign_up/sign_up_with_email/sign_up_with_email.dart';
import 'package:message2/video/view/video_page.dart';

class MyRouter {
  MyRouter._();
  static final GoRouter instance = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainView(),
      ),
      // login
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),

      // signup
      GoRoute(
        path: SignUpPage.routePath,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: SignInWithEmail.routePath,
        builder: (context, state) => const SignInWithEmail(),
      ),
      GoRoute(
        path: SignUpWithEmailPage.routePath,
        builder: (context, state) => const SignUpWithEmailPage(),
      ),
      GoRoute(
        path: VerifyEmailPage.routePath,
        builder: (context, state) => const VerifyEmailPage(),
      ),
      // home
      GoRoute(
        path: HomePage.routePath,
        builder: (context, state) => const HomePage(),
      ),
      // video
      GoRoute(
        path: VideoPage.routePath,
        builder: (context, state) => const VideoPage(),
      ),
      // chat
      GoRoute(
        path: ChatPage.routePath,
        builder: (context, state) => const ChatPage(),
      ),

      // profile
      GoRoute(
        path: ProfilePage.routePath,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: VerifyOtpPage.routePath,
        builder: (context, state) => const VerifyOtpPage(),
      ),
      GoRoute(
        path: CreateNewPassword.routePath,
        builder: (context, state) => const CreateNewPassword(),
      ),
      GoRoute(
        path: LegalAndPolicy.routePath,
        builder: (context, state) => const LegalAndPolicy(),
      ),
      GoRoute(
        path: ChangePassword.routePath,
        builder: (context, state) => const ChangePassword(),
      ),
      GoRoute(
        path: NotificationPage.routePath,
        builder: (context, state) => const NotificationPage(),
      ),
      GoRoute(
        path: ViewProfilePage.routePath,
        builder: (context, state) => const ViewProfilePage(),
      ),
      GoRoute(
        path: ProfileImagePreview.routePath,
        builder: (context, state) => const ProfileImagePreview(),
      ),
      GoRoute(
        path: SecurityPage.routePath,
        builder: (context, state) => const SecurityPage(),
      ),
    ],
  );
}
