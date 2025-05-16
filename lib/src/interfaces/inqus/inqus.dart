import 'package:flutter_inqus/src/interfaces/inqus/inqus_base.dart';
import 'package:flutter_inqus/src/interfaces/inqus/element/inqus_element_base.dart';

abstract class Inqus extends InqusBase {
  Inqus({super.title, super.description, required this.pages});

  final List<InqusPage> pages;
}
