import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';
import 'package:message2/notification/notification.dart';
import 'package:message2/shared/card_list_tile_switcher.dart';
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

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  bool assignTask = false;
  bool moveTask = false;
  bool message = false;
  bool createProject = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(AppFontSize.xs),
            ),
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
                  height: AppFontSize.md,
                ),
                CardListTileSwitcher(
                  title: 'Assign Task And Project',
                  sectionType: assignTask,
                  onChange: (value) {
                    setState(() {
                      assignTask = value;
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
                  title: 'Move Task',
                  sectionType: moveTask,
                  onChange: (value) {
                    setState(() {
                      moveTask = value;
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
                  title: 'Message',
                  sectionType: message,
                  onChange: (value) {
                    setState(() {
                      message = value;
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
                  title: 'Create Project',
                  sectionType: createProject,
                  onChange: (value) {
                    setState(() {
                      createProject = value;
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
