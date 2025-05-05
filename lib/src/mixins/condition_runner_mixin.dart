mixin ConditionRunnerMixin {
  bool runConditions<T>({required List<bool Function(T)> conditions, required List<T> values}) {
    return _internalRunner<T>(conditions: conditions, values: values);
  }

  bool _internalRunner<T>({
    required List<bool Function(T)> conditions,
    required List<T> values,
    int initialIndex = 0,
    int? endIndex,
  }) {
    assert(initialIndex >= 0, 'Initial index must be non-negative.');
    final end = endIndex ?? conditions.length - 1;

    if (initialIndex >= end) {
      return true;
    }

    final firstCondition = conditions[initialIndex];

    assert(end < conditions.length, 'End index must be less than the length of conditions.');
    final lastCondition = conditions[end];

    if (values.every((element) => firstCondition(element) && lastCondition(element))) {
      return _internalRunner(conditions: conditions, values: values, initialIndex: initialIndex + 1, endIndex: end - 1);
    } else {
      return false;
    }
  }
}
