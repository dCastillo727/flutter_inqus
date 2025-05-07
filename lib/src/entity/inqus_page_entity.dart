import 'package:flutter_inqus/src/interfaces/inqus/element/inqus_element_base.dart';

class InqusPageEntity extends InqusPage {
  InqusPageEntity({
    super.title,
    super.description,
    required super.name,
    super.isRequired,
    required super.elements,
    super.readOnly,
  });
}
