import 'package:flutter_inqus/src/interfaces/inqus/element/inqus_element.dart';
import 'package:flutter_inqus/src/interfaces/inqus/question/inqus_question.dart';
import 'package:flutter_inqus/src/services/dispatcher/inqus_dispatcher.dart';

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
    //TODO
    return switch (question as InqusQuestion) {
      _ => InqusElementType.text,
    };
  }

  Map<String, dynamic> serialize<T extends InqusElement>(T instance) {
    return switch (this) {
      InqusElementType.panel => InqusDispatcher.serialization.serialize<InqusPanel>(instance as InqusPanel),
      InqusElementType.text => InqusDispatcher.serialization.serialize<InqusQuestionText>(
        instance as InqusQuestionText,
      ),
      InqusElementType.radiogroup => InqusDispatcher.serialization.serialize<InqusQuestionRadiogroup>(
        instance as InqusQuestionRadiogroup,
      ),
      InqusElementType.comment => InqusDispatcher.serialization.serialize<InqusQuestionComment>(
        instance as InqusQuestionComment,
      ),
      InqusElementType.rating => InqusDispatcher.serialization.serialize<InqusQuestionRating>(
        instance as InqusQuestionRating,
      ),
      InqusElementType.html => InqusDispatcher.serialization.serialize<InqusQuestionHtml>(
        instance as InqusQuestionHtml,
      ),
      InqusElementType.checkbox => InqusDispatcher.serialization.serialize<InqusQuestionCheckbox>(
        instance as InqusQuestionCheckbox,
      ),
      InqusElementType.select => InqusDispatcher.serialization.serialize<InqusQuestionSelect>(
        instance as InqusQuestionSelect,
      ),
    };
  }

  InqusElement deserialize(Map<String, dynamic> map) {
    return switch (this) {
      InqusElementType.panel => InqusDispatcher.serialization.deserialize<InqusPanel>(map),
      InqusElementType.text => InqusDispatcher.serialization.deserialize<InqusQuestionText>(map),
      InqusElementType.radiogroup => InqusDispatcher.serialization.deserialize<InqusQuestionRadiogroup>(map),
      InqusElementType.comment => InqusDispatcher.serialization.deserialize<InqusQuestionComment>(map),
      InqusElementType.rating => InqusDispatcher.serialization.deserialize<InqusQuestionRating>(map),
      InqusElementType.html => InqusDispatcher.serialization.deserialize<InqusQuestionHtml>(map),
      InqusElementType.checkbox => InqusDispatcher.serialization.deserialize<InqusQuestionCheckbox>(map),
      InqusElementType.select => InqusDispatcher.serialization.deserialize<InqusQuestionSelect>(map),
    };
  }
}
