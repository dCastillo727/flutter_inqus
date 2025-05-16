import 'package:flutter_inqus/src/entity/inqus_element_type.dart';
import 'package:flutter_inqus/src/interfaces/serializer.dart';

class InqusElementTypeSerializer extends Serializer<InqusElementType> {
  @override
  InqusElementType fromMap(String map) {
    return switch (map) {
      'panel' => InqusElementType.panel,
      'text' => InqusElementType.text,
      'radiogroup' => InqusElementType.radiogroup,
      'comment' => InqusElementType.comment,
      'rating' => InqusElementType.rating,
      'html' => InqusElementType.html,
      'checkbox' => InqusElementType.checkbox,
      'select' => InqusElementType.select,
      _ => throw Exception('Unknown InqusElementType: $map'),
    };
  }

  @override
  String toMap(InqusElementType instance) {
    return switch (instance) {
      InqusElementType.panel => 'panel',
      InqusElementType.text => 'text',
      InqusElementType.radiogroup => 'radiogroup',
      InqusElementType.comment => 'comment',
      InqusElementType.rating => 'rating',
      InqusElementType.html => 'html',
      InqusElementType.checkbox => 'checkbox',
      InqusElementType.select => 'select',
    };
  }
}
