part of 'inqus_element_base.dart';

abstract class InqusPage extends InqusElementBase {
  InqusPage({
    super.title,
    super.description,
    required super.name,
    super.isRequired,
    required this.elements,
    super.readOnly,
  });

  final List<InqusElement>? elements;
}
