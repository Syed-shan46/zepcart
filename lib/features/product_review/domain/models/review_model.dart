// Model representing a user review with user info, comment, rating, avatar, and timestamp.
class ReviewModel {
  final String user;
  final String comment;
  final String avatarUrl;
  final double rating;
  final String timeAgo;

  ReviewModel({
    required this.user,
    required this.comment,
    required this.avatarUrl,
    required this.rating,
    required this.timeAgo,
  });
}
