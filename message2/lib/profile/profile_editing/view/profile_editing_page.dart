import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';
import 'package:message2/profile/profile_editing/profile_editing.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileEditingPage extends StatelessWidget {
  const ProfileEditingPage({super.key});

  static const String routePath = '/profile-editing';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileEditingCubit(),
      child: const ProfileEditingView(),
    );
  }
}

class ProfileEditingView extends StatefulWidget {
  const ProfileEditingView({super.key});

  @override
  State<ProfileEditingView> createState() => _ProfileEditingViewState();
}

class _ProfileEditingViewState extends State<ProfileEditingView> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _bdController;
  late TextEditingController _experienceController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: 'Shaut');
    _lastNameController = TextEditingController(text: 'Meas');
    _emailController = TextEditingController(text: 'sauth.phouek168@gmail.com');
    _phoneController = TextEditingController(text: '096 999 9999');
    _bdController = TextEditingController(text: '11 November 2001');
    _experienceController = TextEditingController(text: '2 years');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileEditingCubit, ProfileEditingState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade50,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: .2,
                backgroundColor: AppColors.whiteColor,
                title: Text(
                  'Profile',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                stretch: true,
                pinned: true,
                leading: Container(
                  width: 72,
                  height: 72,
                  margin: const EdgeInsets.only(left: AppFontSize.xs),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.blackColor.withOpacity(.6),
                    ),
                  ),
                ),
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/background.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                fillOverscroll: true,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppFontSize.md,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // edit profile image with stack
                      const SizedBox(height: AppFontSize.lg),

                      Stack(
                        fit: StackFit.passthrough,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            padding: const EdgeInsets.all(AppFontSize.xs),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(6),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/sticker.webp'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 30,
                            right: -12,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  showAnimatedDialog(
                                    context: context,
                                    animationType:
                                        DialogTransitionType.fadeScale,
                                    barrierDismissible: true,
                                    builder: (context) {
                                      return AlertDialog(
                                        insetPadding: const EdgeInsets.all(
                                            AppFontSize.xxxlg),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: AppFontSize.md,
                                          vertical: AppFontSize.sm,
                                        ),
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              AppFontSize.lg),
                                        ),
                                        backgroundColor: Colors.grey.shade200,
                                        title: Text(
                                          textAlign: TextAlign.center,
                                          'Change your picture',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                color: Colors.black,
                                                fontWeight:
                                                    AppFontWeight.semiBold,
                                                fontSize: AppFontSize.xlg,
                                              ),
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Divider(),
                                            const SizedBox(
                                              height: AppFontSize.lg,
                                            ),
                                            buildContainer(
                                              'Take a photo',
                                              PhosphorIcons.fill.camera,
                                              () {},
                                              true,
                                            ),
                                            const SizedBox(
                                                height: AppFontSize.md),
                                            buildContainer(
                                              'Choose from your life',
                                              PhosphorIcons.fill.fileImage,
                                              () {},
                                              true,
                                            ),
                                            const SizedBox(
                                                height: AppFontSize.md),
                                            buildContainer(
                                              'Delete Photo',
                                              PhosphorIcons.fill.trash,
                                              () {},
                                              false,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: PhosphorIcon(
                                  PhosphorIcons.duotone.notePencil,
                                  color: AppColors.whiteColor,
                                  size: AppFontSize.xlg,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppFontSize.md),
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // first name label and text field
                            const SizedBox(height: AppFontSize.md),
                            Text(
                              'First Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.grey,
                                    fontWeight: AppFontWeight.thin,
                                    fontSize: AppFontSize.sm,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            // text field
                            InputTextField(
                              hintText: 'First Name',
                              controller: _firstNameController,
                            ),
                            const SizedBox(height: AppFontSize.lg),
                            Text(
                              'Last Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.grey,
                                    fontWeight: AppFontWeight.thin,
                                    fontSize: AppFontSize.sm,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            // text field
                            InputTextField(
                              hintText: 'Last Name',
                              controller: _lastNameController,
                            ),
                            const SizedBox(height: AppFontSize.lg),
                            Text(
                              'Email',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.grey,
                                    fontWeight: AppFontWeight.thin,
                                    fontSize: AppFontSize.sm,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            // text field
                            InputTextField(
                              hintText: 'Enter your email',
                              controller: _emailController,
                            ),

                            const SizedBox(height: AppFontSize.lg),
                            Text(
                              'Phone Number',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.grey,
                                    fontWeight: AppFontWeight.thin,
                                    fontSize: AppFontSize.sm,
                                  ),
                            ),

                            const SizedBox(height: 4),
                            // text field
                            InputTextField(
                              hintText: 'Enter your phone number',
                              controller: _phoneController,
                            ),
                            const SizedBox(height: AppFontSize.lg),
                            Text(
                              'Date of Birth',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.grey,
                                    fontWeight: AppFontWeight.thin,
                                    fontSize: AppFontSize.sm,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            InputTextField(
                              hintText: 'Select your date of birth',
                              controller: _bdController,
                              onTap: () {
                                // show date picker
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                ).then((value) {
                                  if (value != null) {
                                    _bdController.text =
                                        DateFormat('dd/MM/yyyy').format(value);
                                  }
                                });
                              },
                              suffixIcon: PhosphorIcon(
                                PhosphorIcons.thin.calendarCheck,
                                color: AppColors.primaryColor,
                              ),
                            ),

                            // container that content radio and label male and female
                            const SizedBox(height: AppFontSize.lg),
                            Text(
                              'Date of Birth',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.grey,
                                    fontWeight: AppFontWeight.thin,
                                    fontSize: AppFontSize.sm,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor
                                          .withOpacity(.06),
                                      border: Border.all(
                                        color: AppColors.primaryColor
                                            .withOpacity(.2),
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(AppFontSize.xs),
                                    ),
                                    child: Row(
                                      children: [
                                        // radio
                                        Radio(
                                          value: 1,
                                          groupValue: 1,
                                          onChanged: (value) {},
                                        ),
                                        Text('Male'),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: AppFontSize.md),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor
                                          .withOpacity(.06),
                                      border: Border.all(
                                        color: AppColors.primaryColor
                                            .withOpacity(.2),
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(AppFontSize.xs),
                                    ),
                                    child: Row(
                                      children: [
                                        // check radio
                                        Radio(
                                          value: 2,
                                          groupValue: 1,
                                          onChanged: (value) {},
                                        ),
                                        const Text('Female'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppFontSize.lg),
                            Text(
                              'Experiences',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.grey,
                                    fontWeight: AppFontWeight.thin,
                                    fontSize: AppFontSize.sm,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            // text field
                            InputTextField(
                              hintText: 'Enter your experience',
                              controller: _experienceController,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.only(
              bottom: AppFontSize.md,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppFontSize.md,
              vertical: AppFontSize.md,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(AppFontSize.xs),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Save Change',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: AppFontSize.md,
                      ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildContainer(
    String title,
    PhosphorIconData icon,
    VoidCallback onTap,
    bool isGrey,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppFontSize.md,
          vertical: AppFontSize.md,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade300.withOpacity(.7),
          borderRadius: BorderRadius.circular(AppFontSize.xs),
        ),
        width: double.infinity,
        child: Row(
          children: [
            PhosphorIcon(
              icon,
              color: isGrey ? AppColors.blackColor : AppColors.redColor,
            ),
            const SizedBox(
              width: AppFontSize.md,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: AppFontSize.md,
                fontWeight: AppFontWeight.semiBold,
                color: isGrey ? AppColors.blackColor : AppColors.redColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.onTap,
    this.suffixIcon,
  });

  final String hintText;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.06),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(.2),
        ),
        borderRadius: BorderRadius.circular(AppFontSize.xs),
      ),
      child: TextFormField(
        onTap: onTap,
        initialValue: controller.text,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: AppFontWeight.thin,
              fontSize: AppFontSize.md,
            ),
        decoration: InputDecoration(
          suffix: suffixIcon,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.grey.shade400,
                fontWeight: AppFontWeight.thin,
                fontSize: AppFontSize.sm,
              ),
          // border none
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppFontSize.lg,
            vertical: AppFontSize.sm,
          ),
        ),
      ),
    );
  }
}
