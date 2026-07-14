class GameConfig {
  final String id;
  final String title;
  final String unlockAfterLessonId;
  final String type; // e.g., 'bubble_pop'
  final Map<String, dynamic> content;

  const GameConfig({
    required this.id,
    required this.title,
    required this.unlockAfterLessonId,
    required this.type,
    this.content = const {},
  });

  factory GameConfig.fromJson(Map<String, dynamic> json) {
    return GameConfig(
      id: json['id'] as String,
      title: json['title'] as String,
      unlockAfterLessonId: json['unlockAfterLessonId'] as String,
      type: json['type'] as String,
      content: Map<String, dynamic>.from(json['content'] as Map? ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'unlockAfterLessonId': unlockAfterLessonId,
    'type': type,
    'content': content,
  };
}
