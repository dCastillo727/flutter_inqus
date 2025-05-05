part of 'inqus_element.dart';

abstract class InqusQuestionBase extends InqusElement {
  InqusQuestionBase({super.title, super.description, required super.name, super.isRequired, super.readOnly});
}
