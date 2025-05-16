import 'package:flutter_inqus/src/entity/inqus_element_type.dart';
import 'package:flutter_inqus/src/interfaces/inqus/element/inqus_element.dart';

part 'inqus_question_text.dart';
part 'inqus_question_radiogroup.dart';
part 'inqus_question_comment.dart';
part 'inqus_question_rating.dart';
part 'inqus_question_html.dart';
part 'inqus_question_checkbox.dart';
part 'inqus_question_select.dart';

sealed class InqusQuestion extends InqusQuestionBase {
  InqusQuestion({super.title, super.description, required super.name, super.isRequired, super.readOnly});

  @override
  InqusElementType get type => InqusElementType.fromQuestion(this);
}
