import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';
import 'package:message2/profile/view_profile/view_profile.dart';
import 'package:message2/profile/view_profile/widgets/view_profile_image.dart';

class ViewProfilePage extends StatelessWidget {
  const ViewProfilePage({super.key});

  static const String routePath = '/view-profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ViewProfileCubit(),
      child: const ViewProfileView(),
    );
  }
}

class ViewProfileView extends StatefulWidget {
  const ViewProfileView({super.key});

  @override
  State<ViewProfileView> createState() => _ViewProfileViewState();
}

class _ViewProfileViewState extends State<ViewProfileView> {
  bool _showAction = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // if scroll up showAction to true, else false
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_scrollController.offset >= 220) {
          setState(() {
            _showAction = true;
          });
        }
      }
      // check if scroll down
      else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        // if scroll down and scroll position is not at the top
        if (_scrollController.offset <= 0) {
          setState(() {
            _showAction = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewProfileCubit, ViewProfileState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: CustomScrollView(
            controller: _scrollController,
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
                actions: [
                  if (_showAction)
                    AnimatedContainer(
                      margin: const EdgeInsets.only(right: AppFontSize.xs),
                      curve: Curves.easeIn,
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(.2),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('assets/images/sticker.webp'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      duration: const Duration(milliseconds: 200),
                    )
                  else
                    Container(),
                ],
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
                pinned: true,
                expandedHeight: 260,
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
                hasScrollBody: false,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppFontSize.md,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context)
                                .push(ProfileImagePreview.routePath);
                          },
                          child: Container(
                            height: 120,
                            width: 120,
                            padding: const EdgeInsets.all(AppFontSize.xs),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(.2),
                              borderRadius: BorderRadius.circular(6),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/sticker.webp'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppFontSize.md),
                        const Text(
                          'Shaut Meaz',
                          style: TextStyle(
                            fontWeight: AppFontWeight.bold,
                            fontSize: AppFontSize.xxlg,
                          ),
                        ),
                        const SizedBox(height: AppFontSize.md),
                        Row(
                          children: [
                            Text(
                              'Junior Flutter Developer',
                              style: TextStyle(
                                color: AppColors.greyColor,
                              ),
                            ),
                            Text(
                              ' at Camsolution Technology',
                              style: TextStyle(
                                color: AppColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppFontSize.md),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 6,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(),
                                child: const Text('Send Message'),
                              ),
                            ),
                            const SizedBox(width: AppFontSize.md),
                            Expanded(
                              flex: 3,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColors.greyColor.withOpacity(.2),
                                ),
                                child: const Text(
                                  'Invited',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: AppFontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppFontSize.md),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppFontSize.lg,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildExpanded(
                                'Project',
                                '2+',
                              ),
                              Container(
                                width: 1,
                                height: 32,
                                color: Colors.grey.shade300,
                              ),
                              buildExpanded(
                                'Experience',
                                '7 Months',
                              ),
                              Container(
                                width: 1,
                                height: 32,
                                color: Colors.grey.shade300,
                              ),
                              buildExpanded(
                                'Rate',
                                '4.0/5',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppFontSize.xlg),
                        const Text(
                          'About Us',
                          style: TextStyle(
                            fontWeight: AppFontWeight.semiBold,
                            fontSize: AppFontSize.lg,
                          ),
                        ),
                        const SizedBox(height: AppFontSize.md),
                        Text(
                          'CamSolution is a professional software development company joined by the most talented team who are really passionate about what they have been doing and offer professional IT solutions expertise to help our customer grow. We have a clear understanding of the development requirements, and we have the knowledge, skills and experience to complete the project successfully. Through the understanding of business need, we provide a great technology solution that enables businesses to achieve their aspirations.',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: AppFontWeight.light,
                            height: 1.8,
                          ),
                        ),
                        const SizedBox(
                          height: AppFontSize.lg,
                        ),
                        const Text(
                          'Location',
                          style: TextStyle(
                            fontWeight: AppFontWeight.semiBold,
                            fontSize: AppFontSize.lg,
                          ),
                        ),
                        const SizedBox(
                          height: AppFontSize.lg,
                        ),
                        Image.asset(
                          'assets/images/background.jpeg',
                          // height: 600,
                          fit: BoxFit.fitHeight,
                        ),
                        Image.asset(
                          'assets/images/background.jpeg',
                          // height: 600,
                          fit: BoxFit.fitHeight,
                        ),
                        Image.asset(
                          'assets/images/background.jpeg',
                          // height: 600,
                          fit: BoxFit.fitHeight,
                        ),
                        Image.asset(
                          'assets/images/background.jpeg',
                          // height: 600,
                          fit: BoxFit.fitHeight,
                        ),
                        Image.asset(
                          'assets/images/background.jpeg',
                          // height: 600,
                          fit: BoxFit.fitHeight,
                        ),
                        Image.asset(
                          'assets/images/background.jpeg',
                          // height: 600,
                          fit: BoxFit.fitHeight,
                        ),
                        Image.asset(
                          'assets/images/background.jpeg',
                          // height: 600,
                          fit: BoxFit.fitHeight,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildExpanded(String title, String subTittle) {
    return Expanded(
      flex: 3,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: AppFontSize.lg,
                fontWeight: AppFontWeight.medium,
              ),
            ),
            const SizedBox(height: AppFontSize.xs),
            Text(
              subTittle,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: AppFontSize.lg,
                fontWeight: AppFontWeight.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
