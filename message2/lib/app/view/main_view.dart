import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:message2/chat/chat.dart';
import 'package:message2/home/home.dart';
import 'package:message2/navigation/navigation.dart';
import 'package:message2/profile/profile.dart';
import 'package:message2/video/video.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routePath = '/';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
      ],
      child: const _BodyMainView(),
    );
  }
}

class _BodyMainView extends StatefulWidget {
  const _BodyMainView();

  @override
  State<_BodyMainView> createState() => _BodyMainViewState();
}

class _BodyMainViewState extends State<_BodyMainView>
    with SingleTickerProviderStateMixin {
  late TabController tabController; // declare tab controller

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          VideoPage(),
          Scaffold(
            body: Center(
              child: Text('Add post'),
            ),
          ),
          ChatPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: NavigationPage(tabController: tabController),
    );
  }
}
