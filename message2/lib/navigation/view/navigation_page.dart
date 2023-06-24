import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    // return bottom app bar
    return BottomAppBar(
      notchMargin: 8,
      child: TabBar(
        indicator: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.green.shade300,
              width: 2,
            ),
          ),
        ),
        labelColor: Colors.green.shade300,
        controller: tabController,
        unselectedLabelColor: Colors.grey.shade400,
        indicatorColor: Colors.green.shade300,
        overlayColor:
            MaterialStateProperty.all(Colors.green.shade100.withOpacity(.2)),
        tabs: [
          Tab(
            icon: PhosphorIcon(
              PhosphorIcons.light.house,
            ),
            text: 'Home',
          ),
          Tab(
            icon: PhosphorIcon(
              PhosphorIcons.light.video,
            ),
            text: 'Video',
          ),
          Tab(
            icon: PhosphorIcon(
              PhosphorIcons.light.chatCircle,
            ),
            text: 'Chat',
          ),
          Tab(
            icon: PhosphorIcon(
              PhosphorIcons.light.userCircle,
            ),
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}
