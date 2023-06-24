// GoRouter configuration
// GoRouter is a declarative router for Flutter.
import 'package:go_router/go_router.dart';
import 'package:message2/app/view/main_view.dart';
import 'package:message2/chat/chat.dart';
import 'package:message2/forgot_password/create_password/view/create_new_password.dart';
import 'package:message2/forgot_password/verify_email/verify_email.dart';
import 'package:message2/forgot_password/verify_otp/view/verify_otp_page.dart';
import 'package:message2/home/view/home_page.dart';
import 'package:message2/login/login.dart';
import 'package:message2/login/widget/sign_in_with_email.dart';
import 'package:message2/profile/view/profile_page.dart';
import 'package:message2/sign_up/sign_up.dart';
import 'package:message2/sign_up/sign_up_with_email/sign_up_with_email.dart';
import 'package:message2/video/view/video_page.dart';

class MyRouter {
  MyRouter._();
  static final GoRouter instance = GoRouter(
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const MainView(),
      ),
      // login
      GoRoute(
        path: '/',
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
      )
    ],
  );
}
