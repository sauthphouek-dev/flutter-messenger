import 'package:flutter/material.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';
import 'package:message2/shared/custom_app_bar.dart';
import 'package:message2/shared/elevated_button_widget.dart';
import 'package:message2/shared/text_field_widget.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  static const String routePath = '/change-password';

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late TextEditingController _currentPdController;
  late TextEditingController _newPdController;
  late TextEditingController _confirmPdController;
  bool isCurrentPdVisible = false;
  bool isNewPdVisible = false;
  bool isConfirmPdVisible = false;

  @override
  void initState() {
    super.initState();
    _currentPdController = TextEditingController();
    _newPdController = TextEditingController();
    _confirmPdController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const CustomAppBar(
        title: 'Change Password',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppFontSize.md,
          vertical: AppFontSize.md,
        ),
        child: SafeArea(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'The new password must be different from the current password',
                  style: TextStyle(
                    fontSize: AppFontSize.xlg,
                    fontWeight: AppFontWeight.semiBold,
                  ),
                ),
                const SizedBox(
                  height: AppFontSize.xxxlg,
                ),
                Text(
                  'Current password',
                  style: TextStyle(
                    fontSize: AppFontSize.lg,
                    fontWeight: AppFontWeight.semiBold,
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(
                  height: AppFontSize.xs,
                ),
                TextFieldWidget(
                  controller: _currentPdController,
                  hintText: 'Enter your password',
                  isShowPassword: isCurrentPdVisible,
                  obscureText: true,
                  onTap: () {
                    setState(() {
                      isCurrentPdVisible = !isCurrentPdVisible;
                    });
                  },
                ),
                const SizedBox(
                  height: AppFontSize.xlg,
                ),
                Text(
                  'New password',
                  style: TextStyle(
                    fontSize: AppFontSize.lg,
                    fontWeight: AppFontWeight.semiBold,
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(
                  height: AppFontSize.xs,
                ),
                TextFieldWidget(
                  controller: _newPdController,
                  hintText: 'Enter your password',
                  isShowPassword: isNewPdVisible,
                  obscureText: true,
                  onTap: () {
                    setState(() {
                      isNewPdVisible = !isNewPdVisible;
                    });
                  },
                ),
                const SizedBox(
                  height: AppFontSize.xlg,
                ),
                Text(
                  'Confirm password',
                  style: TextStyle(
                    fontSize: AppFontSize.lg,
                    fontWeight: AppFontWeight.semiBold,
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: AppFontSize.xs),
                TextFieldWidget(
                  controller: _confirmPdController,
                  hintText: 'Enter your password',
                  isShowPassword: isConfirmPdVisible,
                  obscureText: true,
                  onTap: () {
                    setState(() {
                      isConfirmPdVisible = !isConfirmPdVisible;
                    });
                  },
                ),
                const Spacer(),
                ElevatedButtonWidget(
                  title: 'Submit',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
