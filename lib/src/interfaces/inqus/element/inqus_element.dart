import 'package:flutter_inqus/src/entity/inqus_element_type.dart';
import 'package:flutter_inqus/src/interfaces/inqus/element/inqus_element_base.dart';

part 'inqus_panel.dart';
part 'inqus_question.dart';

sealed class InqusElement extends InqusElementBase {
  InqusElement({super.title, super.description, required super.name, super.isRequired, super.readOnly});

  InqusElementType get type => InqusElementType.fromElement(this);
}
