
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/functions/format_time.dart';
import 'package:sketch/core/utils/app_assets.dart';
import 'package:sketch/features/notification/data/model/notificatioin_model.dart';

class NotificationTileItem extends StatelessWidget {
  final NotificationModel notification;

  const NotificationTileItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: SvgPicture.asset(
            notification.person.image ?? Assets.imagesAvatar22),
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '${notification.person.userName} ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: notification.message),
          ],
          style: const TextStyle(color: Colors.black),
        ),
      ),
      subtitle: Text(notification.description ?? ''),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(formatTime(notification.date)),
          if (!notification.isRead)
            const Icon(Icons.circle, color: Colors.green, size: 8),
        ],
      ),
    );
  }

  
}
