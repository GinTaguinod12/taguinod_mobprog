import 'package:flutter/material.dart';
import 'package:taguinod_mobprog/widgets/notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: 1, // Halimbawa lang, palitan ito ng aktwal na bilang ng notifications
        itemBuilder: (context, index) {
          return const NotificationWidget(
            name: 'Kaisa',
            post: 'This is Called Dance.',
            description: 'Kaisa liked your post.',
          );
        },
      ),
    );
  }
}
