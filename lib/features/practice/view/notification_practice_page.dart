import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';

class NotificationPracticePage extends StatefulWidget {
  const NotificationPracticePage({super.key});

  @override
  State<NotificationPracticePage> createState() =>
      _NotificationPracticePageState();
}

class _NotificationPracticePageState extends State<NotificationPracticePage> {
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;
  String _message = '未初始化';

  @override
  void initState() {
    super.initState();
    _initNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green_300,
        scrolledUnderElevation: 0,
        title: const Text('本地通知'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(_message),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _initialized ? _showNotification : null,
              child: const Text('发送本地通知'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _initNotifications() async {
    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await _notifications.initialize(settings: settings);

    await _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
    await _notifications
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    if (!mounted) return;
    setState(() {
      _initialized = true;
      _message = '通知已初始化';
    });
  }

  Future<void> _showNotification() async {
    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'practice_notification',
        'Practice 通知',
        channelDescription: 'Practice 本地通知演示',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await _notifications.show(
      id: 1,
      title: '本地通知',
      body: '这是一条来自 Practice 的本地通知',
      notificationDetails: details,
    );
  }
}
