import 'package:flutter_inqus/src/interfaces/inqus/inqus_text.dart';

abstract class InqusBase {
  InqusBase({this.title, this.description, this.readOnly = false});

  //TODO: add more fields
  final InqusText? title;
  final InqusText? description;
  final bool readOnly;
}
