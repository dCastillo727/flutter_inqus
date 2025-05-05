import 'package:flutter_inqus/src/interfaces/inqus/inqus_base.dart';
import 'package:flutter_inqus/src/interfaces/inqus/element/inqus_element_base.dart';
import 'package:flutter_inqus/src/interfaces/inqus/element/inqus_element.dart';

abstract class InqusInterface extends InqusBase {
  InqusInterface({super.title, super.description, this.pages, List<InqusElement>? elements});

  final List<InqusPage>? pages;
}
