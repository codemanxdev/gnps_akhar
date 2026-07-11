import '../models/journey.dart';

/// Sample content used until Firestore is connected (see ContentRepository).
/// Mirrors exactly the shape lessons will have in Firestore, so swapping
/// the data source later requires no changes to models or UI.
///
/// Lessons are grouped by task type (trace, spelling, matching, fill-in-
/// blank, sentence arrangement). Sections within each lesson group tasks
/// thematically (animals, colors, family, etc.) as before.
///
/// NOTE: Gurmukhi spellings/grammar here should be reviewed by a native
/// speaker before shipping to real learners.
final Journey mockJourney = Journey.fromJson({
  'version': 6,
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
        {
          'id': 'section_palatal',
          'title': 'Palatal Sounds',
          'tasks': [
            {
              'id': 'trace_11',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਚ', 'transliteration': 'cha'},
            },
            {
              'id': 'trace_12',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਛ', 'transliteration': 'chha'},
            },
            {
              'id': 'trace_13',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਜ', 'transliteration': 'ja'},
            },
            {
              'id': 'trace_14',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਝ', 'transliteration': 'jha'},
            },
            {
              'id': 'trace_15',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਞ', 'transliteration': 'nya'},
            },
          ],
        },
        {
          'id': 'section_retroflex',
          'title': 'Retroflex Sounds',
          'tasks': [
            {
              'id': 'trace_16',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਟ', 'transliteration': 'tta'},
            },
            {
              'id': 'trace_17',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਠ', 'transliteration': 'ttha'},
            },
            {
              'id': 'trace_18',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਡ', 'transliteration': 'dda'},
            },
            {
              'id': 'trace_19',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਢ', 'transliteration': 'ddha'},
            },
            {
              'id': 'trace_20',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਣ', 'transliteration': 'nna'},
            },
          ],
        },
        {
          'id': 'section_dental',
          'title': 'Dental Sounds',
          'tasks': [
            {
              'id': 'trace_21',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਤ', 'transliteration': 'ta'},
            },
            {
              'id': 'trace_22',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਥ', 'transliteration': 'tha'},
            },
            {
              'id': 'trace_23',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਦ', 'transliteration': 'da'},
            },
            {
              'id': 'trace_24',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਧ', 'transliteration': 'dha'},
            },
            {
              'id': 'trace_25',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਨ', 'transliteration': 'na'},
            },
          ],
        },
        {
          'id': 'section_labial',
          'title': 'Labial Sounds',
          'tasks': [
            {
              'id': 'trace_26',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਪ', 'transliteration': 'pa'},
            },
            {
              'id': 'trace_27',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਫ', 'transliteration': 'pha'},
            },
            {
              'id': 'trace_28',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਬ', 'transliteration': 'ba'},
            },
            {
              'id': 'trace_29',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਭ', 'transliteration': 'bha'},
            },
            {
              'id': 'trace_30',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਮ', 'transliteration': 'ma'},
            },
          ],
        },
        {
          'id': 'section_semivowels',
          'title': 'Semivowels',
          'tasks': [
            {
              'id': 'trace_31',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਯ', 'transliteration': 'ya'},
            },
            {
              'id': 'trace_32',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਰ', 'transliteration': 'ra'},
            },
            {
              'id': 'trace_33',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਲ', 'transliteration': 'la'},
            },
            {
              'id': 'trace_34',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ਵ', 'transliteration': 'va'},
            },
            {
              'id': 'trace_35',
              'type': 'trace',
              'pointsAwarded': 10,
              'content': {'letter': 'ੜ', 'transliteration': 'rra'},
            },
          ],
        },
      ],
    },
    {
      'id': 'lesson_spelling',
      'title': 'Spelling',
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
            {
              'id': 'spelling_03',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '🐟',
                'targetWord': 'ਮੱਛੀ',
                'letterBank': ['ਮ', 'ੱ', 'ਛੀ', 'ਕੁ', 'ਤਾ'],
              },
            },
            {
              'id': 'spelling_04',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '🐴',
                'targetWord': 'ਘੋੜਾ',
                'letterBank': ['ਘੋ', 'ੜਾ', 'ਬਿ', 'ੱ', 'ਲੀ'],
              },
            },
            {
              'id': 'spelling_05',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '🐘',
                'targetWord': 'ਹਾਥੀ',
                'letterBank': ['ਹਾ', 'ਥੀ', 'ਕੁ', 'ੱ', 'ਤਾ'],
              },
            },
          ],
        },
        {
          'id': 'section_objects',
          'title': 'Everyday Objects',
          'tasks': [
            {
              'id': 'spelling_06',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '📖',
                'targetWord': 'ਕਿਤਾਬ',
                'letterBank': ['ਕਿ', 'ਤਾ', 'ਬ', 'ਸੂ', 'ਰਜ'],
              },
            },
            {
              'id': 'spelling_07',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '☀️',
                'targetWord': 'ਸੂਰਜ',
                'letterBank': ['ਸੂ', 'ਰਜ', 'ਕਿ', 'ਤਾ', 'ਬ'],
              },
            },
            {
              'id': 'spelling_08',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '⚽',
                'targetWord': 'ਗੇਂਦ',
                'letterBank': ['ਗੇਂ', 'ਦ', 'ਤਾ', 'ਰਾ', 'ਬ'],
              },
            },
            {
              'id': 'spelling_09',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '⭐',
                'targetWord': 'ਤਾਰਾ',
                'letterBank': ['ਤਾ', 'ਰਾ', 'ਗੇਂ', 'ਦ', 'ਸੂ'],
              },
            },
            {
              'id': 'spelling_10',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '🌙',
                'targetWord': 'ਚੰਦ',
                'letterBank': ['ਚੰ', 'ਦ', 'ਤਾ', 'ਰਾ', 'ਗੇਂ'],
              },
            },
          ],
        },
        {
          'id': 'section_fruits',
          'title': 'Fruits',
          'tasks': [
            {
              'id': 'spelling_11',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '🍎',
                'targetWord': 'ਸੇਬ',
                'letterBank': ['ਸੇ', 'ਬ', 'ਕੇ', 'ਲਾ', 'ਅੰ'],
              },
            },
            {
              'id': 'spelling_12',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '🍌',
                'targetWord': 'ਕੇਲਾ',
                'letterBank': ['ਕੇ', 'ਲਾ', 'ਸੇ', 'ਬ', 'ਅੰ'],
              },
            },
            {
              'id': 'spelling_13',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '🥭',
                'targetWord': 'ਅੰਬ',
                'letterBank': ['ਅੰ', 'ਬ', 'ਸੇ', 'ਕੇ', 'ਲਾ'],
              },
            },
            {
              'id': 'spelling_14',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '🍊',
                'targetWord': 'ਸੰਤਰਾ',
                'letterBank': ['ਸੰ', 'ਤ', 'ਰਾ', 'ਕੇ', 'ਲਾ'],
              },
            },
            {
              'id': 'spelling_15',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '🍇',
                'targetWord': 'ਅੰਗੂਰ',
                'letterBank': ['ਅੰ', 'ਗੂ', 'ਰ', 'ਸੇ', 'ਬ'],
              },
            },
          ],
        },
        {
          'id': 'section_colors',
          'title': 'Colors',
          'tasks': [
            {
              'id': 'spelling_16',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '🔴',
                'targetWord': 'ਲਾਲ',
                'letterBank': ['ਲਾ', 'ਲ', 'ਨੀ', 'ਲਾ', 'ਹ'],
              },
            },
            {
              'id': 'spelling_17',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '🔵',
                'targetWord': 'ਨੀਲਾ',
                'letterBank': ['ਨੀ', 'ਲਾ', 'ਪੀ', 'ਲਾ', 'ਹ'],
              },
            },
            {
              'id': 'spelling_18',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '🟡',
                'targetWord': 'ਪੀਲਾ',
                'letterBank': ['ਪੀ', 'ਲਾ', 'ਹ', 'ਲਾ', 'ਲ'],
              },
            },
            {
              'id': 'spelling_19',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '🟢',
                'targetWord': 'ਹਰਾ',
                'letterBank': ['ਹ', 'ਰਾ', 'ਲਾ', 'ਲ', 'ਨੀ'],
              },
            },
            {
              'id': 'spelling_20',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '⚫',
                'targetWord': 'ਕਾਲਾ',
                'letterBank': ['ਕਾ', 'ਲਾ', 'ਚਿ', 'ੱ', 'ਟਾ'],
              },
            },
            {
              'id': 'spelling_21',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '⚪',
                'targetWord': 'ਚਿੱਟਾ',
                'letterBank': ['ਚਿ', 'ੱ', 'ਟਾ', 'ਕਾ', 'ਲਾ'],
              },
            },
          ],
        },
        {
          'id': 'section_numbers_1_5',
          'title': 'Numbers 1–5',
          'tasks': [
            {
              'id': 'spelling_22',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '1️⃣',
                'targetWord': 'ਇੱਕ',
                'letterBank': ['ਇ', 'ੱ', 'ਕ', 'ਦੋ', 'ਪੰ'],
              },
            },
            {
              'id': 'spelling_23',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '2️⃣',
                'targetWord': 'ਦੋ',
                'letterBank': ['ਦੋ', 'ਇ', 'ੱ', 'ਕ', 'ਜ'],
              },
            },
            {
              'id': 'spelling_24',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '3️⃣',
                'targetWord': 'ਤਿੰਨ',
                'letterBank': ['ਤਿੰ', 'ਨ', 'ਚਾ', 'ਰ', 'ਦੋ'],
              },
            },
            {
              'id': 'spelling_25',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '4️⃣',
                'targetWord': 'ਚਾਰ',
                'letterBank': ['ਚਾ', 'ਰ', 'ਪੰ', 'ਜ', 'ਤਿੰ'],
              },
            },
            {
              'id': 'spelling_26',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '5️⃣',
                'targetWord': 'ਪੰਜ',
                'letterBank': ['ਪੰ', 'ਜ', 'ਚਾ', 'ਰ', 'ਇ'],
              },
            },
          ],
        },
        {
          'id': 'section_numbers_6_10',
          'title': 'Numbers 6–10',
          'tasks': [
            {
              'id': 'spelling_27',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '6️⃣',
                'targetWord': 'ਛੇ',
                'letterBank': ['ਛੇ', 'ਸੱ', 'ਤ', 'ਅੱ', 'ਠ'],
              },
            },
            {
              'id': 'spelling_28',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '7️⃣',
                'targetWord': 'ਸੱਤ',
                'letterBank': ['ਸੱ', 'ਤ', 'ਛੇ', 'ਅੱ', 'ਠ'],
              },
            },
            {
              'id': 'spelling_29',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '8️⃣',
                'targetWord': 'ਅੱਠ',
                'letterBank': ['ਅੱ', 'ਠ', 'ਸੱ', 'ਤ', 'ਨੌਂ'],
              },
            },
            {
              'id': 'spelling_30',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '9️⃣',
                'targetWord': 'ਨੌਂ',
                'letterBank': ['ਨੌਂ', 'ਦ', 'ਸ', 'ਅੱ', 'ਠ'],
              },
            },
            {
              'id': 'spelling_31',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '🔟',
                'targetWord': 'ਦਸ',
                'letterBank': ['ਦ', 'ਸ', 'ਨੌਂ', 'ਸੱ', 'ਤ'],
              },
            },
          ],
        },
        {
          'id': 'section_family_words',
          'title': 'Family Members',
          'tasks': [
            {
              'id': 'spelling_32',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '👩',
                'targetWord': 'ਮਾਂ',
                'letterBank': ['ਮਾਂ', 'ਪਿ', 'ਤਾ', 'ਭ', 'ਰਾ'],
              },
            },
            {
              'id': 'spelling_33',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '👨',
                'targetWord': 'ਪਿਤਾ',
                'letterBank': ['ਪਿ', 'ਤਾ', 'ਮਾਂ', 'ਭ', 'ਰਾ'],
              },
            },
            {
              'id': 'spelling_34',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '👦',
                'targetWord': 'ਭਰਾ',
                'letterBank': ['ਭ', 'ਰਾ', 'ਭੈ', 'ਣ', 'ਮਾਂ'],
              },
            },
            {
              'id': 'spelling_35',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '👧',
                'targetWord': 'ਭੈਣ',
                'letterBank': ['ਭੈ', 'ਣ', 'ਭ', 'ਰਾ', 'ਪਿ'],
              },
            },
            {
              'id': 'spelling_36',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '👴',
                'targetWord': 'ਦਾਦਾ ਜੀ',
                'letterBank': ['ਦਾ', 'ਦਾ', 'ਜੀ', 'ਦਾ', 'ਦੀ'],
              },
            },
            {
              'id': 'spelling_37',
              'type': 'spelling',
              'pointsAwarded': 15,
              'content': {
                'emoji': '👵',
                'targetWord': 'ਦਾਦੀ ਜੀ',
                'letterBank': ['ਦਾ', 'ਦੀ', 'ਜੀ', 'ਦਾ', 'ਦਾ'],
              },
            },
          ],
        },
      ],
    },
    {
      'id': 'lesson_matching',
      'title': 'Match the Word',
      'order': 3,
      'visible': true,
      'sections': [
        {
          'id': 'section_matching_animals',
          'title': 'Animals',
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
            {
              'id': 'wordSelect_02',
              'type': 'wordSelection',
              'pointsAwarded': 15,
              'content': {
                'word': 'ਕੁੱਤਾ',
                'correctEmoji': '🐕',
                'distractorEmojis': ['🐈', '🐟', '🐴'],
              },
            },
            {
              'id': 'wordSelect_03',
              'type': 'wordSelection',
              'pointsAwarded': 15,
              'content': {
                'word': 'ਮੱਛੀ',
                'correctEmoji': '🐟',
                'distractorEmojis': ['🐘', '🐈', '🐕'],
              },
            },
          ],
        },
        {
          'id': 'section_matching_colors',
          'title': 'Colors',
          'tasks': [
            {
              'id': 'wordSelect_04',
              'type': 'wordSelection',
              'pointsAwarded': 15,
              'content': {
                'word': 'ਲਾਲ',
                'correctEmoji': '🔴',
                'distractorEmojis': ['🔵', '🟡', '🟢'],
              },
            },
            {
              'id': 'wordSelect_05',
              'type': 'wordSelection',
              'pointsAwarded': 15,
              'content': {
                'word': 'ਹਰਾ',
                'correctEmoji': '🟢',
                'distractorEmojis': ['⚫', '⚪', '🔵'],
              },
            },
          ],
        },
        {
          'id': 'section_matching_family',
          'title': 'Family Members',
          'tasks': [
            {
              'id': 'wordSelect_06',
              'type': 'wordSelection',
              'pointsAwarded': 15,
              'content': {
                'word': 'ਮਾਂ',
                'correctEmoji': '👩',
                'distractorEmojis': ['👨', '👦', '👧'],
              },
            },
            {
              'id': 'wordSelect_07',
              'type': 'wordSelection',
              'pointsAwarded': 15,
              'content': {
                'word': 'ਭਰਾ',
                'correctEmoji': '👦',
                'distractorEmojis': ['👧', '👩', '👴'],
              },
            },
            {
              'id': 'wordSelect_08',
              'type': 'wordSelection',
              'pointsAwarded': 15,
              'content': {
                'word': 'ਦਾਦੀ ਜੀ',
                'correctEmoji': '👵',
                'distractorEmojis': ['👴', '👨', '👩'],
              },
            },
          ],
        },
      ],
    },
    {
      'id': 'lesson_fill_in_blank',
      'title': 'Fill in the Blanks',
      'order': 4,
      'visible': true,
      'sections': [
        {
          'id': 'section_blanks_basic',
          'title': 'Everyday Objects & Animals',
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
            {
              'id': 'fillInBlank_02',
              'type': 'fillInBlank',
              'pointsAwarded': 15,
              'content': {
                'sentenceParts': ['ਇਹ', '___', 'ਹੈ'],
                'correctWord': 'ਸੇਬ',
                'options': ['ਸੇਬ', 'ਕਿਤਾਬ', 'ਗੇਂਦ'],
              },
            },
            {
              'id': 'fillInBlank_03',
              'type': 'fillInBlank',
              'pointsAwarded': 15,
              'content': {
                'sentenceParts': ['ਇਹ', '___', 'ਹੈ'],
                'correctWord': 'ਘੋੜਾ',
                'options': ['ਘੋੜਾ', 'ਮੱਛੀ', 'ਹਾਥੀ'],
              },
            },
          ],
        },
        {
          'id': 'section_blanks_advanced',
          'title': 'Colors & Family',
          'tasks': [
            {
              'id': 'fillInBlank_04',
              'type': 'fillInBlank',
              'pointsAwarded': 15,
              'content': {
                'sentenceParts': ['ਮੇਰੀ', '___', 'ਦਾ', 'ਨਾਮ', 'ਸੀਤਾ', 'ਹੈ'],
                'correctWord': 'ਮਾਂ',
                'options': ['ਮਾਂ', 'ਭਰਾ', 'ਕਿਤਾਬ'],
              },
            },
            {
              'id': 'fillInBlank_05',
              'type': 'fillInBlank',
              'pointsAwarded': 15,
              'content': {
                'sentenceParts': ['ਕੁੱਤਾ', '___', 'ਹੈ'],
                'correctWord': 'ਕਾਲਾ',
                'options': ['ਕਾਲਾ', 'ਲਾਲ', 'ਪੀਲਾ'],
              },
            },
          ],
        },
        {
          'id': 'section_family_sentences',
          'title': 'Family Sentences',
          'tasks': [
            {
              'id': 'fillInBlank_06',
              'type': 'fillInBlank',
              'pointsAwarded': 15,
              'content': {
                'sentenceParts': ['ਮੇਰਾ', '___', 'ਸਕੂਲ', 'ਜਾਂਦਾ', 'ਹੈ'],
                'correctWord': 'ਭਰਾ',
                'options': ['ਭਰਾ', 'ਦਾਦੀ ਜੀ', 'ਬਿੱਲੀ'],
              },
            },
            {
              'id': 'fillInBlank_07',
              'type': 'fillInBlank',
              'pointsAwarded': 15,
              'content': {
                'sentenceParts': ['ਮੇਰੀ', '___', 'ਕਿਤਾਬ', 'ਪੜ੍ਹਦੀ', 'ਹੈ'],
                'correctWord': 'ਭੈਣ',
                'options': ['ਭੈਣ', 'ਪਿਤਾ', 'ਗਾਂ'],
              },
            },
          ],
        },
      ],
    },
    {
      'id': 'lesson_arrange_sentence',
      'title': 'Sentence Arrangement',
      'order': 5,
      'visible': true,
      'sections': [
        {
          'id': 'section_arrangement_basic',
          'title': 'Everyday Sentences',
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
            {
              'id': 'arrange_02',
              'type': 'arrangeSentence',
              'pointsAwarded': 20,
              'content': {
                'words': ['ਮੈਂ', 'ਸੇਬ', 'ਖਾਂਦਾ', 'ਹਾਂ'],
                'correctOrder': [0, 1, 2, 3],
              },
            },
            {
              'id': 'arrange_03',
              'type': 'arrangeSentence',
              'pointsAwarded': 20,
              'content': {
                'words': ['ਇਹ', 'ਮੇਰੀ', 'ਕਿਤਾਬ', 'ਹੈ'],
                'correctOrder': [0, 1, 2, 3],
              },
            },
          ],
        },
        {
          'id': 'section_arrangement_advanced',
          'title': 'More Sentences',
          'tasks': [
            {
              'id': 'arrange_04',
              'type': 'arrangeSentence',
              'pointsAwarded': 20,
              'content': {
                'words': ['ਬਿੱਲੀ', 'ਦੁੱਧ', 'ਪੀਂਦੀ', 'ਹੈ'],
                'correctOrder': [0, 1, 2, 3],
              },
            },
            {
              'id': 'arrange_05',
              'type': 'arrangeSentence',
              'pointsAwarded': 20,
              'content': {
                'words': ['ਮੇਰਾ', 'ਭਰਾ', 'ਗੇਂਦ', 'ਖੇਡਦਾ', 'ਹੈ'],
                'correctOrder': [0, 1, 2, 3, 4],
              },
            },
          ],
        },
        {
          'id': 'section_family_arrangement',
          'title': 'Family Sentences',
          'tasks': [
            {
              'id': 'arrange_06',
              'type': 'arrangeSentence',
              'pointsAwarded': 20,
              'content': {
                'words': ['ਮੇਰੀ', 'ਮਾਂ', 'ਖਾਣਾ', 'ਬਣਾਉਂਦੀ', 'ਹੈ'],
                'correctOrder': [0, 1, 2, 3, 4],
              },
            },
            {
              'id': 'arrange_07',
              'type': 'arrangeSentence',
              'pointsAwarded': 20,
              'content': {
                'words': ['ਮੇਰਾ', 'ਪਿਤਾ', 'ਕੰਮ', 'ਕਰਦਾ', 'ਹੈ'],
                'correctOrder': [0, 1, 2, 3, 4],
              },
            },
          ],
        },
      ],
    },
  ],
});
