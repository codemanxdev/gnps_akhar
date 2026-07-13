/// Lesson data for "Spelling".
/// Part of the app's bundled content store (see `lib/data/journey_data.dart`).
///
/// Reviewed & validated: every `letterBank` was checked so its correct pieces
/// concatenate exactly to `targetWord`, and so no bank contains a duplicate tile
/// (duplicates found in the original Colors section — ਲਾਲ/ਨੀਲਾ/ਪੀਲਾ each had a
/// repeated 'ਲਾ' tile — have been fixed). New sections added: Household Items,
/// Travel & Transport, School, and Weather.
final Map<String, dynamic> lessonSpelling = {
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
            'emoji': '🐱',
            'targetWord': 'ਬਿੱਲੀ',
            'letterBank': ['ਬਿ', 'ੱ', 'ਲੀ', 'ਮ', 'ਅ'],
          },
        },
        {
          'id': 't6',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🦮',
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
            'letterBank': ['ਲਾ', 'ਲ', 'ਨੀ', 'ਪੀ', 'ਹ'],
          },
        },
        {
          'id': 'spelling_17',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🔵',
            'targetWord': 'ਨੀਲਾ',
            'letterBank': ['ਨੀ', 'ਲਾ', 'ਪੀ', 'ਲ', 'ਹ'],
          },
        },
        {
          'id': 'spelling_18',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🟡',
            'targetWord': 'ਪੀਲਾ',
            'letterBank': ['ਪੀ', 'ਲਾ', 'ਹ', 'ਨੀ', 'ਲ'],
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
      'id': 'section_household',
      'title': 'Household Items',
      'tasks': [
        {
          'id': 'household_01',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🪑',
            'targetWord': 'ਕੁਰਸੀ',
            'letterBank': ['ਕੁ', 'ਰ', 'ਸੀ', 'ਵਾ', 'ਜ਼ਾ'],
          },
        },
        {
          'id': 'household_02',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🚪',
            'targetWord': 'ਦਰਵਾਜ਼ਾ',
            'letterBank': ['ਦਰ', 'ਵਾ', 'ਜ਼ਾ', 'ਖਿ', 'ਕੀ'],
          },
        },
        {
          'id': 'household_03',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🪟',
            'targetWord': 'ਖਿੜਕੀ',
            'letterBank': ['ਖਿ', 'ੜ', 'ਕੀ', 'ਮੰ', 'ਜਾ'],
          },
        },
        {
          'id': 'household_04',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🛏️',
            'targetWord': 'ਮੰਜਾ',
            'letterBank': ['ਮੰ', 'ਜਾ', 'ਸੋ', 'ਫ਼ਾ', 'ਕੁ'],
          },
        },
        {
          'id': 'household_05',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🛋️',
            'targetWord': 'ਸੋਫ਼ਾ',
            'letterBank': ['ਸੋ', 'ਫ਼ਾ', 'ਦਰ', 'ਖਿ', 'ੜ'],
          },
        },
      ],
    },
    {
      'id': 'section_travel',
      'title': 'Travel & Transport',
      'tasks': [
        {
          'id': 'travel_01',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🚗',
            'targetWord': 'ਕਾਰ',
            'letterBank': ['ਕਾ', 'ਰ', 'ਬ', 'ੱ', 'ਸ'],
          },
        },
        {
          'id': 'travel_02',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🚌',
            'targetWord': 'ਬੱਸ',
            'letterBank': ['ਬ', 'ੱ', 'ਸ', 'ਕਾ', 'ਰ'],
          },
        },
        {
          'id': 'travel_03',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🚆',
            'targetWord': 'ਰੇਲਗੱਡੀ',
            'letterBank': ['ਰੇਲ', 'ਗੱ', 'ਡੀ', 'ਜ', 'ਹਾ'],
          },
        },
        {
          'id': 'travel_04',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '✈️',
            'targetWord': 'ਜਹਾਜ਼',
            'letterBank': ['ਜ', 'ਹਾ', 'ਜ਼', 'ਸਾਈ', 'ਕਲ'],
          },
        },
        {
          'id': 'travel_05',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🚲',
            'targetWord': 'ਸਾਈਕਲ',
            'letterBank': ['ਸਾਈ', 'ਕਲ', 'ਰੇਲ', 'ਗੱ', 'ਡੀ'],
          },
        },
      ],
    },
    {
      'id': 'section_school',
      'title': 'School',
      'tasks': [
        {
          'id': 'school_01',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '✏️',
            'targetWord': 'ਪੈਨਸਿਲ',
            'letterBank': ['ਪੈਨ', 'ਸਿ', 'ਲ', 'ਬ', 'ਤਾ'],
          },
        },
        {
          'id': 'school_02',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🖊️',
            'targetWord': 'ਕਲਮ',
            'letterBank': ['ਕ', 'ਲ', 'ਮ', 'ਗੁ', 'ਰੂ'],
          },
        },
        {
          'id': 'school_03',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🎒',
            'targetWord': 'ਬਸਤਾ',
            'letterBank': ['ਬ', 'ਸ', 'ਤਾ', 'ਤ', 'ਖ'],
          },
        },
        {
          'id': 'school_04',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🧑‍🏫',
            'targetWord': 'ਗੁਰੂ',
            'letterBank': ['ਗੁ', 'ਰੂ', 'ਪੈਨ', 'ਸਿ', 'ਬ'],
          },
        },
        {
          'id': 'school_05',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '📝',
            'targetWord': 'ਤਖਤੀ',
            'letterBank': ['ਤ', 'ਖ', 'ਤੀ', 'ਕ', 'ਮ'],
          },
        },
      ],
    },
    {
      'id': 'section_weather',
      'title': 'Weather',
      'tasks': [
        {
          'id': 'weather_01',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🌧️',
            'targetWord': 'ਮੀਂਹ',
            'letterBank': ['ਮੀਂ', 'ਹ', 'ਬ', 'ੱ', 'ਦਲ'],
          },
        },
        {
          'id': 'weather_02',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '☁️',
            'targetWord': 'ਬੱਦਲ',
            'letterBank': ['ਬ', 'ੱ', 'ਦਲ', 'ਹ', 'ਵਾ'],
          },
        },
        {
          'id': 'weather_03',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '💨',
            'targetWord': 'ਹਵਾ',
            'letterBank': ['ਹ', 'ਵਾ', 'ਬ', 'ਰ', 'ਫ਼'],
          },
        },
        {
          'id': 'weather_04',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '❄️',
            'targetWord': 'ਬਰਫ਼',
            'letterBank': ['ਬ', 'ਰ', 'ਫ਼', 'ਧੁੰ', 'ਦ'],
          },
        },
        {
          'id': 'weather_05',
          'type': 'spelling',
          'pointsAwarded': 15,
          'content': {
            'emoji': '🌫️',
            'targetWord': 'ਧੁੰਦ',
            'letterBank': ['ਧੁੰ', 'ਦ', 'ਮੀਂ', 'ਹ', 'ਬ'],
          },
        },
      ],
    },
  ],
};
