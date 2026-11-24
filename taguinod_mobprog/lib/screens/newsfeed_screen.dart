import 'package:flutter/material.dart';
import 'package:taguinod_mobprog/widgets/newsfeed_card.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

      @override
      Widget build(BuildContext context) {
        return ListView(
          children: const[
            NewsfeedCard(
              userName: 'John Doe',
              postContent: 'This is a sample post content.',
              date: '2023-08-15',
              numOfLikes: 10,
            ),
            NewsfeedCard(
              userName: 'Jane Smith',
              postContent: 'Another sample post content.',
              date: '2023-08-14',
              numOfLikes: 5,
            ),
          ],
        );
      }
}