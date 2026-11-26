import 'package:flutter/material.dart';
import 'package:taguinod_mobprog/constants.dart';
import 'package:taguinod_mobprog/widgets/action_buttons.dart'; // ✅ I-import ang bagong file

class NewsfeedCard extends StatefulWidget {
  final String userName;
  final String? avatarimage;
  final String date;
  final String postContent;
  final int numOfLikes;
  final int numOfComments;
  final String? image;

  const NewsfeedCard({
    super.key,
    required this.userName,
    this.avatarimage,
    required this.date,
    required this.postContent,
    this.image,
    this.numOfLikes = 0,
    this.numOfComments = 0,
  });

  @override
  State<NewsfeedCard> createState() => _NewsfeedCardState();
}

class _NewsfeedCardState extends State<NewsfeedCard> {
  bool isLiked = false;
  late int currentLikes;

  @override
  void initState() {
    super.initState();
    currentLikes = widget.numOfLikes;
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      currentLikes += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. HEADER
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: widget.avatarimage != null
                      ? AssetImage(widget.avatarimage!)
                      : null,
                  child: widget.avatarimage == null
                      ? const Icon(Icons.person, color: Colors.grey)
                      : null,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.date,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.public,
                              size: 12, color: Colors.grey[600]),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_horiz, color: Colors.grey[700]),
              ],
            ),
          ),

          // 2. POST TEXT
          if (widget.postContent.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                widget.postContent,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          const SizedBox(height: 8),

          // 3. IMAGE (Enhancement 1)
          PostImageWidget(imagePath: widget.image),

          // 4. LIKE COUNT (Total likes sa itaas ng buttons)
          if (currentLikes > 0)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Row(
                children: [
                  const Icon(Icons.thumb_up, color: fbPrimary, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    currentLikes.toString(),
                    style: TextStyle(color: Colors.grey[700], fontSize: 13),
                  ),
                ],
              ),
            ),

          Divider(height: 1, color: Colors.grey[300]),

          // 5. ACTION BUTTONS (Enhancement 3 - Widget based na!)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ✅ Like Button Widget
                LikeButtonWidget(
                  isLiked: isLiked,
                  likeCount: currentLikes,
                  onTap: _toggleLike,
                ),
                // ✅ Comment Button Widget
                CommentButtonWidget(
                  commentCount: widget.numOfComments,
                  onTap: () {},
                ),
                // ✅ Share Button Widget
                ShareButtonWidget(onTap: () {}),
              ],
            ),
          ),

          Divider(height: 1, color: Colors.grey[300]),

          // 6. COMMENT INPUT & VIEW COMMENTS
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(Icons.person,
                          size: 20, color: Colors.grey),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Write a comment...',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'View all comments',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
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

// ---------------------------------------------------------
// ENHANCEMENT 1: HIWALAY NA WIDGET PARA SA POST IMAGE
// ---------------------------------------------------------
class PostImageWidget extends StatelessWidget {
  final String? imagePath;

  const PostImageWidget({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    if (imagePath == null || imagePath!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Image.asset(
      imagePath!,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        debugPrint('❌ Image failed to load: $imagePath');
        return Container(
          height: 200,
          width: double.infinity,
          color: Colors.grey[300],
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.broken_image, size: 40, color: Colors.grey),
                SizedBox(height: 8),
                Text(
                  'Image not available',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
