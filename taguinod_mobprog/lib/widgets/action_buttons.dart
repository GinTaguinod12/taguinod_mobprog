import 'package:flutter/material.dart';
import 'package:taguinod_mobprog/constants.dart';

// ✅ ENHANCEMENT 3: Hiwalay na Widget para sa Like Button
class LikeButtonWidget extends StatelessWidget {
  final bool isLiked;
  final int likeCount;
  final VoidCallback onTap;

  const LikeButtonWidget({
    super.key,
    required this.isLiked,
    required this.likeCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
              size: 20,
              color: isLiked ? fbPrimary : Colors.grey[700],
            ),
            const SizedBox(width: 6),
            Text(
              likeCount > 0 ? 'Like ($likeCount)' : 'Like',
              style: TextStyle(
                color: isLiked ? fbPrimary : Colors.grey[700],
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ ENHANCEMENT 3: Hiwalay na Widget para sa Comment Button
class CommentButtonWidget extends StatelessWidget {
  final int commentCount;
  final VoidCallback onTap;

  const CommentButtonWidget({
    super.key,
    required this.commentCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 20,
              color: Colors.grey[700],
            ),
            const SizedBox(width: 6),
            Text(
              commentCount > 0 ? 'Comment ($commentCount)' : 'Comment',
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Share Button (para kumpleto pa rin, pero hindi required)
class ShareButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const ShareButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              Icons.share_outlined,
              size: 20,
              color: Colors.grey[700],
            ),
            const SizedBox(width: 6),
            Text(
              'Share',
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
