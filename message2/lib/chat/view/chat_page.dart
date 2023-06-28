import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/chat/cubit/chat_cubit.dart';
import 'package:message2/chat/widgets/view_chat_detail.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class StoryAdded {
  const StoryAdded({
    required this.id,
    required this.storyCount,
  });
  final String id;
  final int storyCount;
}

class StaffInformation {
  const StaffInformation({
    required this.id,
    required this.name,
    required this.position,
    required this.imageUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.isOnline,
    this.storyList,
  });
  final String id;
  final String name;
  final String position;
  final String imageUrl;
  final String lastMessage;
  final String lastMessageTime;
  final bool isOnline;
  final List<StoryAdded>? storyList;

  // create 10 staff information
  static const List<StaffInformation> staffList = [
    StaffInformation(
      id: '1',
      name: 'John Doe',
      position: 'CEO',
      // network image
      imageUrl: 'https://picsum.photos/250?image=9',
      lastMessage: 'Hello, how are you?',
      lastMessageTime: '10:00 AM',
      isOnline: true,
      storyList: [
        StoryAdded(
          id: '1',
          storyCount: 1,
        ),
        StoryAdded(
          id: '2',
          storyCount: 2,
        ),
        StoryAdded(
          id: '3',
          storyCount: 3,
        ),
      ],
    ),
    StaffInformation(
      id: '2',
      name: 'Jane Doe',
      position: 'CTO',
      imageUrl: 'https://picsum.photos/250?image=10',
      lastMessage: 'Hello, how are you?',
      lastMessageTime: '10:00 AM',
      isOnline: false,
      storyList: [
        StoryAdded(
          id: '1',
          storyCount: 1,
        ),
        StoryAdded(
          id: '2',
          storyCount: 2,
        ),
      ],
    ),
    StaffInformation(
      id: '3',
      name: 'John Doe',
      position: 'CEO',
      imageUrl: 'https://picsum.photos/250?image=11',
      lastMessage: 'Hello, how are you?',
      lastMessageTime: '10:00 AM',
      isOnline: true,
    ),
    StaffInformation(
      id: '4',
      name: 'Jane Doe',
      position: 'CTO',
      imageUrl: 'https://picsum.photos/250?image=12',
      lastMessage: 'Hello, how are you?',
      lastMessageTime: '10:00 AM',
      isOnline: false,
    ),
    StaffInformation(
      id: '5',
      name: 'John Doe',
      position: 'CEO',
      imageUrl: 'https://picsum.photos/250?image=13',
      lastMessage: 'Hello, how are you?',
      lastMessageTime: '10:00 AM',
      isOnline: true,
      storyList: [
        StoryAdded(
          id: '1',
          storyCount: 1,
        ),
        StoryAdded(
          id: '2',
          storyCount: 2,
        ),
        StoryAdded(
          id: '3',
          storyCount: 3,
        ),
      ],
    ),
    StaffInformation(
      id: '6',
      name: 'Jane Doe',
      position: 'CTO',
      imageUrl: 'https://picsum.photos/250?image=14',
      lastMessage: 'Hello, how are you?',
      lastMessageTime: '10:00 AM',
      isOnline: false,
    ),
    StaffInformation(
      id: '7',
      name: 'John Doe',
      position: 'CEO',
      imageUrl: 'https://picsum.photos/250?image=15',
      lastMessage: 'Hello, how are you?',
      lastMessageTime: '10:00 AM',
      isOnline: true,
    ),
    StaffInformation(
      id: '8',
      name: 'Jane Doe',
      position: 'CTO',
      imageUrl: 'https://picsum.photos/250?image=16',
      lastMessage: 'Hello, how are you?',
      lastMessageTime: '10:00 AM',
      isOnline: false,
      storyList: [
        StoryAdded(
          id: '1',
          storyCount: 1,
        ),
        StoryAdded(
          id: '2',
          storyCount: 2,
        ),
        StoryAdded(
          id: '3',
          storyCount: 3,
        ),
      ],
    ),
  ];
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  static const String routePath = '/chat';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(),
      child: const ChartView(),
    );
  }
}

class ChartView extends StatelessWidget {
  const ChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade100,
            elevation: .4,
            title: const Text('Chats'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // custom search box
                Container(
                  margin: const EdgeInsets.all(AppFontSize.md),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppFontSize.md,
                    vertical: 3,
                  ),
                  // margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(AppFontSize.sm),
                  ),
                  child: Row(
                    children: [
                      PhosphorIcon(PhosphorIcons.light.magnifyingGlass),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppFontSize.md),
                // list scroll vertical direction only name and image
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // add new staff
                      // list of staff
                      ...StaffInformation.staffList.map((staff) {
                        return SizedBox(
                          width: 80,
                          child: Column(
                            children: [
                              buildUserImage(staff, context),
                              const SizedBox(height: AppFontSize.sm),
                              Text(
                                staff.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: AppFontSize.sm,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: AppFontSize.md),

                // list of staff
                ListView.separated(
                  padding: const EdgeInsets.all(AppFontSize.md),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: StaffInformation.staffList.length,
                  itemBuilder: (context, index) {
                    final staff = StaffInformation.staffList[index];
                    return InkWell(
                      splashColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        GoRouter.of(context).push(
                          ViewChatDetail.routePath,
                          extra: staff,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            // status online with image
                            buildUserImage(staff, context),

                            const SizedBox(width: AppFontSize.md),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    staff.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: AppFontSize.sm),
                                  Text(
                                    staff.lastMessage,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Text(staff.lastMessageTime),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildUserImage(StaffInformation staff, BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          ViewChatDetail.routePath,
          extra: staff,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: staff.storyList != null
              ? Border.all(
                  color: AppColors.primaryColor,
                  width: 2,
                )
              : Border.all(
                  color: Colors.transparent,
                  width: 0,
                ),
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 2,
                ),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(staff.imageUrl),
              ),
            ),
            if (staff.isOnline)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
