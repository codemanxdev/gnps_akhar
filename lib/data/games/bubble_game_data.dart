/// Configuration for the "Letter Bubbles" game.
final Map<String, dynamic> bubbleGameConfig = {
  'id': 'bubble_pop_letters',
  'title': 'Letter Bubbles',
  'unlockAfterLessonId': 'lesson_tracing',
  'type': 'bubble_pop',
  'mapXOffset': 150.0,
  'mapYOffset': 80.0,
  'iconName': 'bubble',
  'colorValue': 0xFF2196F3, // Colors.blue
  'content': {
    'pool': 'lessons',
    'spawnRateMs': 1200,
    'minSpeed': 1.5,
    'maxSpeed': 3.5,
    'bubbleSize': 120.0,
  },
};
