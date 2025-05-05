import 'package:flutter_inqus/src/interfaces/inqus/element/inqus_element.dart';
import 'package:flutter_inqus/src/interfaces/inqus/inqus_base.dart';
import 'package:flutter_inqus/src/interfaces/inqus/inqus_text.dart';

part 'inqus_page.dart';

abstract class InqusElementBase extends InqusBase {
  InqusElementBase({super.title, super.description, required this.name, this.isRequired = false, super.readOnly});

  final InqusText name;
  final bool isRequired;
}
