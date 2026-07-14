class GameConfig {
  final String id;
  final String title;
  final String unlockAfterLessonId;
  final String type; // e.g., 'bubble_pop'
  final Map<String, dynamic> content;
  final double? mapXOffset; // Horizontal offset from the anchor lesson
  final double? mapYOffset; // Vertical offset from the anchor lesson
  final String? iconName;
  final int? colorValue;

  const GameConfig({
    required this.id,
    required this.title,
    required this.unlockAfterLessonId,
    required this.type,
    this.content = const {},
    this.mapXOffset,
    this.mapYOffset,
    this.iconName,
    this.colorValue,
  });

  factory GameConfig.fromJson(Map<String, dynamic> json) {
    return GameConfig(
      id: json['id'] as String,
      title: json['title'] as String,
      unlockAfterLessonId: json['unlockAfterLessonId'] as String,
      type: json['type'] as String,
      content: Map<String, dynamic>.from(json['content'] as Map? ?? {}),
      mapXOffset: (json['mapXOffset'] as num?)?.toDouble(),
      mapYOffset: (json['mapYOffset'] as num?)?.toDouble(),
      iconName: json['iconName'] as String?,
      colorValue: (json['colorValue'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'unlockAfterLessonId': unlockAfterLessonId,
    'type': type,
    'content': content,
    'mapXOffset': mapXOffset,
    'mapYOffset': mapYOffset,
    'iconName': iconName,
    'colorValue': colorValue,
  };
}
