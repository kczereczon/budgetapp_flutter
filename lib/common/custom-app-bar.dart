import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.user,
    required this.notifications,
  }) : super(key: key);

  final String user;
  final int notifications;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello,",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              user,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        IconButton(
            onPressed: () => print('Notification pressed'),
            icon: Badge(
              showBadge: notifications > 0,
              badgeContent: Text(
                notifications.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: const Icon(
                Icons.notifications,
                color: Colors.grey,
              ),
            ))
      ],
    );
  }
}