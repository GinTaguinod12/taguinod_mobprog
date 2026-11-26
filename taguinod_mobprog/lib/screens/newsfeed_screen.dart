import 'package:flutter/material.dart';
import 'package:taguinod_mobprog/constants.dart';
import 'package:taguinod_mobprog/widgets/newsfeed_card.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  // Update this list to add, remove, or edit posts. Each post has its own
  // counts, date, and optional image (null means no placeholder is shown).
  static const List<_Post> _posts = [
    _Post(
      userName: 'Ahri',
      avatarImage: 'assets/images/ahri.jpg',
      date: 'November 26, 2026',
      postContent: 'Fire in the hole! #LeagueOfLegends',
      image: 'assets/images/kda.png',
      likes: 10,
      comments: 5,
    ),
    _Post(
      userName: 'Akali',
      avatarImage: 'assets/images/akali.jpg',
      date: 'November 24, 2026',
      postContent: 'Been a minute, but it feels like we never left. #LeagueOfLegends',
      image: 'assets/images/akalipost.jpg',
      likes: 3000,
      comments: 120,
    ),
    _Post(
      userName: 'Kaisa',
      avatarImage: 'assets/images/kaisa.png',
      date: 'November 20, 2026',
      postContent: 'This is Called Dance.',
      image: 'assets/images/kaisapost.png',
      likes: 0,
      comments: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBackgroundColor,
      child: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return NewsfeedCard(
            key: ValueKey('${post.userName}-${post.date}'),
            userName: post.userName,
            avatarimage: post.avatarImage,
            date: post.date,
            postContent: post.postContent,
            image: post.image,
            numOfLikes: post.likes,
            numOfComments: post.comments,
          );
        },
      ),
    );
  }
}

class _Post {
  const _Post({
    required this.userName,
    required this.avatarImage,
    required this.date,
    required this.postContent,
    required this.image,
    required this.likes,
    required this.comments,
  });

  final String userName;
  final String? avatarImage;
  final String date;
  final String postContent;
  final String? image;
  final int likes;
  final int comments;
}
