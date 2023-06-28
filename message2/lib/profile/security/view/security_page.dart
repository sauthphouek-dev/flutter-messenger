import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:message2/app_data/app_font_size.dart';

import 'package:message2/profile/security/security.dart';
import 'package:message2/shared/card_list_tile_switcher.dart';
import 'package:message2/shared/custom_app_bar.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  static const String routePath = '/security';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SecurityCubit(),
      child: const SecurityView(),
    );
  }
}

class SecurityView extends StatefulWidget {
  const SecurityView({super.key});

  @override
  State<SecurityView> createState() => _SecurityViewState();
}

class _SecurityViewState extends State<SecurityView> {
  bool faceId = false;
  bool rememberPw = false;
  bool touchId = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Security'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppFontSize.md,
            vertical: AppFontSize.md,
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppFontSize.lg),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(AppFontSize.xs),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardListTileSwitcher(
                  title: 'Face ID',
                  sectionType: faceId,
                  onChange: (value) {
                    setState(() {
                      faceId = value;
                    });
                  },
                ),
                const SizedBox(
                  height: AppFontSize.md,
                ),
                Divider(
                  thickness: 1.2,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(
                  height: AppFontSize.md,
                ),
                CardListTileSwitcher(
                  title: 'Remember Password',
                  sectionType: rememberPw,
                  onChange: (value) {
                    setState(() {
                      rememberPw = value;
                    });
                  },
                ),
                const SizedBox(
                  height: AppFontSize.md,
                ),
                Divider(
                  thickness: 1.2,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(
                  height: AppFontSize.md,
                ),
                CardListTileSwitcher(
                  title: 'Touch ID',
                  sectionType: touchId,
                  onChange: (value) {
                    setState(() {
                      touchId = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
