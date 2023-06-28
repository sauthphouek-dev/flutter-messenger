import 'package:flutter/material.dart';
import 'package:message2/app_data/app_colors.dart';
import 'package:message2/app_data/app_font_size.dart';
import 'package:message2/app_data/app_font_weight.dart';
import 'package:message2/chat/chat.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ViewChatDetail extends StatefulWidget {
  const ViewChatDetail({super.key, required this.staffInformation});

  static const routePath = '/chat/detail';

  final StaffInformation staffInformation;

  @override
  State<ViewChatDetail> createState() => _ViewChatDetailState();
}

class _ViewChatDetailState extends State<ViewChatDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        iconTheme: IconThemeData(color: AppColors.primaryColor, weight: 20),
        leadingWidth: 60,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: widget.staffInformation.storyList != null
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
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.staffInformation.imageUrl),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.staffInformation.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: AppFontWeight.semiBold,
                  ),
                ),
                const SizedBox(height: 4),
                widget.staffInformation.isOnline
                    ? Text(
                        'Active now',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: AppFontSize.sm,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: PhosphorIcon(
              PhosphorIcons.fill.phone,
              color: AppColors.primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: PhosphorIcon(
              PhosphorIcons.fill.videoCamera,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      body: _ChatDetailBody(staff: widget.staffInformation),
      bottomNavigationBar: Container(
        // height: 120,
        padding: const EdgeInsets.only(
          left: AppFontSize.sm,
          right: AppFontSize.sm,
          bottom: AppFontSize.xxxlg,
        ),
        color: Colors.white,
        child: Row(
          children: [
            PhosphorIcon(
              PhosphorIcons.fill.camera,
              color: AppColors.primaryColor,
            ),
            const SizedBox(width: 8),
            PhosphorIcon(
              PhosphorIcons.fill.image,
              color: AppColors.primaryColor,
            ),
            const SizedBox(width: 8),
            PhosphorIcon(
              PhosphorIcons.fill.microphone,
              color: AppColors.primaryColor,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppFontSize.sm,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    PhosphorIcon(
                      PhosphorIcons.fill.mapPin,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type a message',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            PhosphorIcon(
              PhosphorIcons.fill.thumbsUp,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatDetailBody extends StatelessWidget {
  const _ChatDetailBody({super.key, required this.staff});

  final StaffInformation staff;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppFontSize.sm,
              vertical: AppFontSize.sm,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppFontSize.xlg,
                    vertical: AppFontSize.xxs,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppFontSize.xlg),
                      bottomLeft: Radius.circular(AppFontSize.xlg),
                      topRight: Radius.circular(AppFontSize.xlg),
                    ),
                  ),
                  child: const Text(
                    'Hello',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // this is other account
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppFontSize.sm,
              vertical: AppFontSize.sm,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(staff.imageUrl),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppFontSize.xlg,
                    vertical: AppFontSize.xxs,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(AppFontSize.xlg),
                      topLeft: Radius.circular(AppFontSize.xlg),
                      bottomRight: Radius.circular(AppFontSize.xlg),
                    ),
                  ),
                  child: Text(
                    staff.lastMessage,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
