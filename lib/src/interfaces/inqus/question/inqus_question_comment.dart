part of 'inqus_question.dart';

abstract class InqusQuestionComment extends InqusQuestion {
  InqusQuestionComment({super.title, super.description, required super.name, super.isRequired, super.readOnly});
}
