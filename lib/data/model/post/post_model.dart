class PostModel {
  final String userId;
  final String color;
  final String name;
  final String message;
  final String type;
  final String key;
  final String category;
  final int likes;
  final List messages;

  PostModel(
      {required this.userId,
      required this.color,
      required this.name,
      required this.message,
      required this.category,
      required this.type,
      required this.key,
      this.likes = 0,
      required this.messages});
}
