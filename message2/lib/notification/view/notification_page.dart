import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';
import 'package:message2/app_data/box_shadow.dart';

import 'package:message2/notification/notification.dart';
import 'package:message2/shared/custom_app_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static const String routePath = '/notification';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationCubit(),
      child: const NotificationView(),
    );
  }
}

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: const CustomAppBar(title: 'Notifications'),
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
                    boxShadow: CardBoxShadow.primaryShadow,
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(AppFontSize.xs)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Message Notifications',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: AppFontSize.lg,
                        fontWeight: AppFontWeight.semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: AppFontSize.xlg,
                    ),
                    buildNotificationCard(
                      'Assign Task And Project',
                    ),
                    const SizedBox(
                      height: AppFontSize.lg,
                    ),
                    Divider(
                      thickness: 1.2,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(
                      height: AppFontSize.xlg,
                    ),
                    buildNotificationCard(
                      'Move Task',
                    ),
                    const SizedBox(
                      height: AppFontSize.lg,
                    ),
                    Divider(
                      thickness: 1.2,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(
                      height: AppFontSize.xlg,
                    ),
                    buildNotificationCard('Message'),
                    const SizedBox(
                      height: AppFontSize.lg,
                    ),
                    Divider(
                      thickness: 1.2,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(
                      height: AppFontSize.xlg,
                    ),
                    buildNotificationCard(
                      'Create Project',
                    ),
                    const SizedBox(
                      height: AppFontSize.lg,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildNotificationCard(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: AppFontWeight.semiBold,
            fontSize: AppFontSize.xlg,
            color: Colors.grey.shade900,
          ),
        ),
        Switch.adaptive(
          activeColor: AppColors.primaryColor,
          activeTrackColor: AppColors.primaryColor,
          inactiveThumbColor: AppColors.whiteColor,
          inactiveTrackColor: AppColors.greyColor,
          value: true,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
