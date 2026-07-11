import '../models/journey.dart';

/// Sample content used until Firestore is connected (see ContentRepository).
/// Mirrors exactly the shape lessons will have in Firestore, so swapping
/// the data source later requires no changes to models or UI.
final Journey mockJourney = Journey.fromJson({
  'version': 3,
  'lessons': [
    {
      'id': 'lesson_tracing',
      'title': 'Alphabet Tracing',
      'order': 1,
      'visible': true,
      'sections': [
        {
          'id': 'section_foundation',
          'title': 'Foundation Sounds',
          'tasks': [
            {
              'id': 'trace_01',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ੳ', 'transliteration': 'ura'},
            },
            {
              'id': 'trace_02',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਅ', 'transliteration': 'aira'},
            },
            {
              'id': 'trace_03',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ੲ', 'transliteration': 'iri'},
            },
            {
              'id': 'trace_04',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਸ', 'transliteration': 'sa'},
            },
            {
              'id': 'trace_05',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਹ', 'transliteration': 'ha'},
            },
          ],
        },
        {
          'id': 'section_guttural',
          'title': 'Guttural Sounds',
          'tasks': [
            {
              'id': 'trace_06',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਕ', 'transliteration': 'ka'},
            },
            {
              'id': 'trace_07',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਖ', 'transliteration': 'kha'},
            },
            {
              'id': 'trace_08',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਗ', 'transliteration': 'ga'},
            },
            {
              'id': 'trace_09',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਘ', 'transliteration': 'gha'},
            },
            {
              'id': 'trace_10',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਙ', 'transliteration': 'nga'},
            },
          ],
        },
      ],
    },
    {
      'id': 'lesson_vocabulary',
      'title': 'Vocabulary',
      'order': 2,
      'visible': true,
      'sections': [
        {
          'id': 'section_animals',
          'title': 'Animals',
          'tasks': [
            {
              'id': 't3',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '🐈',
                'targetWord': 'ਬਿੱਲੀ',
                'letterBank': ['ਬਿ', 'ੱ', 'ਲੀ', 'ਮ', 'ਅ'],
              },
            },
            {
              'id': 't6',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '🐕',
                'targetWord': 'ਕੁੱਤਾ',
                'letterBank': ['ਕੁ', 'ੱ', 'ਤਾ', 'ਬ', 'ਲੀ'],
              },
            },
          ],
        },
        {
          'id': 'section_matching',
          'title': 'Match the Word',
          'tasks': [
            {
              'id': 'wordSelect_01',
              'type': 'wordSelection',
              'pointsAwarded': 15,
              'content': {
                'word': 'ਬਿੱਲੀ',
                'correctEmoji': '🐈',
                'distractorEmojis': ['🐕', '📖', '☀️'],
              },
            },
          ],
        },
      ],
    },
    {
      'id': 'lesson_sentences',
      'title': 'Simple Sentences',
      'order': 3,
      'visible': true,
      'sections': [
        {
          'id': 'section_blanks',
          'title': 'Fill in the Blanks',
          'tasks': [
            {
              'id': 'fillInBlank_01',
              'type': 'fillInBlank',
              'pointsAwarded': 15,
              'content': {
                'sentenceParts': ['ਇਹ', '___', 'ਹੈ'],
                'correctWord': 'ਚਿੜੀ',
                'options': ['ਚਿੜੀ', 'ਗਾਂ', 'ਬਿੱਲੀ'],
              },
            },
          ],
        },
        {
          'id': 'section_arrangement',
          'title': 'Sentence Arrangement',
          'tasks': [
            {
              'id': 't5',
              'type': 'arrangeSentence',
              'pointsAwarded': 20,
              'content': {
                'words': ['ਮੈਂ', 'ਸਕੂਲ', 'ਜਾਂਦਾ', 'ਹਾਂ'],
                'correctOrder': [0, 1, 2, 3],
              },
            },
          ],
        },
      ],
    },
  ],
});
