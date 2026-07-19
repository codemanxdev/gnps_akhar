enum TaskType {
  trace,
  spelling,
  wordSelection,
  arrangeSentence,
  fillInBlank,
  letterSelection,
}

TaskType taskTypeFromString(String value) {
  return TaskType.values.firstWhere(
        (t) => t.name == value,
    orElse: () => throw ArgumentError('Unknown task type: $value'),
  );
}