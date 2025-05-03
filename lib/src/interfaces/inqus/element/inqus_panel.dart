part of 'inqus_element.dart';

abstract class InqusPanel extends InqusElement {
  InqusPanel({
    super.title,
    super.description,
    required super.name,
    super.isRequired,
    required this.elements,
    super.readOnly,
  });

  final List<InqusElement>? elements;
}
