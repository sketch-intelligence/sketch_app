import 'package:flutter/material.dart';
import 'package:sketch/core/utils/app_assets.dart';
import 'package:sketch/features/home/presentation/data/models/person_model.dart';
import 'package:sketch/features/notification/data/model/notificatioin_model.dart';
import 'package:sketch/features/notification/data/model/notification_type.dart';
import 'package:sketch/features/notification/presentation/views/widgets/custom_selected_text_button.dart';
import 'package:sketch/features/notification/presentation/views/widgets/notification_list_tile_item.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  static final List<PersonModel> people = [
    PersonModel(userName: 'Jennie Ponce', image: Assets.imagesAvatar23),
    PersonModel(userName: 'Sally Rooney', image: Assets.imagesAvatar23),
    PersonModel(userName: 'Liam Pham', image: Assets.imagesAvatar23),
    PersonModel(userName: 'Kristin Watson', image: Assets.imagesAvatar23),
    PersonModel(userName: 'Jena Nguyen', image: Assets.imagesAvatar23),
    PersonModel(userName: 'Anja O\'Connor', image: Assets.imagesAvatar23),
  ];

  final List<NotificationModel> notifications = [
    NotificationModel(
      person: people[0],
      message: 'liked your video',
      description: 'Laborum aliqua do nostrud ...',
      date: DateTime.now().subtract(const Duration(minutes: 10)),
      type: NotificationType.like,
      isRead: false,
    ),
    NotificationModel(
      person: people[1],
      message: 'added a photo',
      description: 'In pariatur laborum adipisci ...',
      date: DateTime.now().subtract(const Duration(minutes: 10)),
      type: NotificationType.like,
      isRead: false,
    ),
    NotificationModel(
      person: people[2],
      message: 'commented on your post',
      description: 'Cillum Lorem aliqua laboris ...',
      date: DateTime.now().subtract(const Duration(minutes: 20)),
      type: NotificationType.comment,
      isRead: false,
    ),
    NotificationModel(
      person: people[3],
      message: 'liked your post',
      description: 'Cillum Lorem aliqua laboris ...',
      date: DateTime.now().subtract(const Duration(minutes: 10)),
      type: NotificationType.like,
      isRead: true,
    ),
  ];

  String selectedButton = 'All';
  void selectButton(String button) {
    if (selectedButton != button) {
      setState(() {
        selectedButton = button;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 12,
            ),
            CustomTextButton(
              text: 'All',
              isSelected: selectedButton == 'All',
              onPressed: () {
                selectButton('All');
              },
            ),
            CustomTextButton(
              text: 'Unread',
              isSelected: selectedButton == 'Unread',
              onPressed: () {
                selectButton('Unread');
              },
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return NotificationTileItem(notification: notification);
            },
          ),
        ),
      ],
    );
  }
}
