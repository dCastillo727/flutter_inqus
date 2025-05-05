import 'package:flutter_inqus/src/interfaces/inqus/element/inqus_element.dart';
import 'package:flutter_inqus/src/interfaces/inqus/question/inqus_question.dart';

enum InqusElementType {
  panel,
  text,
  radiogroup,
  comment,
  rating,
  html,
  checkbox,
  select;

  static InqusElementType fromElement(InqusElement element) {
    return switch (element) {
      InqusPanel() => InqusElementType.panel,
      InqusQuestionBase() => fromQuestion(element),
    };
  }

  static InqusElementType fromQuestion(InqusQuestionBase question) {
    assert(question is InqusQuestion, 'question must be of type InqusQuestion');

    return switch (question as InqusQuestion) {
      InqusQuestionText() => InqusElementType.text,
    };
  }
}
