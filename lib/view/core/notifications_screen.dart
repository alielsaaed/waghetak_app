import 'package:flutter/material.dart';
import 'package:waghetak_app/constants/constants.dart';

class NotificationScreen extends StatelessWidget {
  static const String id = 'notification_screen';
  final List<NotificationItem> notifications = [
    NotificationItem(
      date: '2023-06-21',
      time: '12:20',
      title: 'تم تأكيد حجزك بنجاح',
      description: 'تم اسند رحلة ممتعة لمقعدك التجربة سفر لا تنسي.',
      icon: Icons.check_circle,
      iconColor: primaryColor,
    ),
    NotificationItem(
      date: '2023-06-21',
      time: '12:20',
      title: 'تحديثات الرحلة',
      description: 'تم تحديث توقيت رحلتك الأولى إلى وجهتك.',
      icon: Icons.call,
      iconColor: primaryColor,
    ),
    NotificationItem(
      date: '2023-06-21',
      time: '12:20',
      title: 'عروض خاصة',
      description: 'توجد لدينا عروض خاصة للسفر لواجهتك.',
      icon: Icons.star,
      iconColor: primaryColor,
    ),
    NotificationItem(
      date: '2023-06-21',
      time: '12:20',
      title: 'تذكير بالرحلة',
      description: 'تذكير أن لديك رحلة في يومك المحدد القادم.',
      icon: Icons.calendar_today,
      iconColor: primaryColor,
    ),
    NotificationItem(
      date: '2023-06-21',
      time: '12:20',
      title: 'تم تأكيد حجزك بنجاح',
      description: 'تم اسند رحلة ممتعة لمقعدك التجربة سفر لا تنسي.',
      icon: Icons.check_circle,
      iconColor: primaryColor,
    ),
    NotificationItem(
      date: '2023-06-21',
      time: '12:20',
      title: 'استعراض تجربتك',
      description: 'تذكير بكتابة رأيك لتجربتك التي انجزتها.',
      icon: Icons.thumb_up,
      iconColor: primaryColor,
    ),
    NotificationItem(
      date: '2023-06-21',
      time: '12:20',
      title: 'تحديثات التطبيق',
      description: 'تم تحديث التطبيق لإضافة مميزات جديدة.',
      icon: Icons.info,
      iconColor: primaryColor,
    ),
    NotificationItem(
      date: '2023-06-21',
      time: '12:20',
      title: 'تذكير بتحديث المعلومات',
      description: 'تذكير بتحديث معلومات حسابك.',
      icon: Icons.update,
      iconColor: primaryColor,
    ),
  ];

  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'التنبيهات',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        leading: const BackButton(),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            leading: Icon(notification.icon, color: notification.iconColor),
            title: Text(notification.title),
            subtitle: Text(notification.description),
            trailing: Text('${notification.date} ${notification.time}'),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final String date;
  final String time;
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;

  NotificationItem({
    required this.date,
    required this.time,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
  });
}
