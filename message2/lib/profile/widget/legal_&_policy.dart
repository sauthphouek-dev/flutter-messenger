import 'package:flutter/material.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';
import 'package:message2/shared/custom_app_bar.dart';

class LegalAndPolicy extends StatefulWidget {
  const LegalAndPolicy({super.key});

  static const String routePath = '/legal';

  @override
  State<LegalAndPolicy> createState() => _LegalAndPolicyState();
}

class _LegalAndPolicyState extends State<LegalAndPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const CustomAppBar(
        title: 'Legal and Policies',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppFontSize.md,
          vertical: AppFontSize.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Terms',
              style: TextStyle(
                fontSize: AppFontSize.lg,
                fontWeight: AppFontWeight.bold,
              ),
            ),
            SizedBox(
              height: AppFontSize.sm,
            ),
            Text(
                'What happened? Dear Users, We, the moderators at the r/FlutterDev subreddit, and the FlutterDev discord, have been protesting Reddit recent changes, which primarily affect Reddit API, by charging an exhorbitant price to use it.These changes were announced with 30 days of notice, effectively',),
            SizedBox(
              height: AppFontSize.xxlg,
            ),
            Text(
              'Changes to the Service and/or Terms:',
              style: TextStyle(
                fontSize: AppFontSize.lg,
                fontWeight: AppFontWeight.bold,
              ),
            ),
            SizedBox(
              height: AppFontSize.sm,
            ),
            Text(
                'What happened? Dear Users, We, the moderators at the r/FlutterDev subreddit, and the FlutterDev discord, have been protesting Reddit recent changes, which primarily affect Reddit API, by charging an exhorbitant price to use it.These changes were announced with 30 days of notice, effectively',),
          ],
        ),
      ),
    );
  }
}
