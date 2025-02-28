import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/presentation/views/mains/notifications/widgets/notification_tile.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Map<String, dynamic>> notifications = [
    {
      "title": "Your payment was successful",
      "subTitle":
          "Your payment for hotel bookings with\nNo Reservation 0123456789 was \nsuccessful \#30,800",
      "date": "Today, 02:58 PM",
      "icon": Icons.check,
      "iconColor": const Color(0xff287D3C),
    },
    {
      "title": "Payment Failed",
      "subTitle": "Your payment for hotel booking failed",
      "date": "Tomorrow, 04:58 PM",
      "icon": Icons.delete_outline_outlined,
      "iconColor": const Color(0xffDA1414),
    }
  ];

  void _deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// Application Bar
            ApplicationBar(
              title: 'Notifications',
              leadingIcon: Icons.arrow_back,
              leadingOnPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: screenHeight * 0.01),

            /// Notifications List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];

                  return Dismissible(
                    key: Key(notification["title"]),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      _deleteNotification(index);
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: NotificationTile(
                      notificationTitle: notification["title"],
                      notificationSubTitle: notification["subTitle"],
                      date: notification["date"],
                      icon: notification["icon"],
                      iconColor: notification["iconColor"],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}