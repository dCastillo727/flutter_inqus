import 'package:flutter_inqus/src/entity/inqus_entity.dart';
import 'package:flutter_inqus/src/interfaces/inqus/element/inqus_element.dart';
import 'package:flutter_inqus/src/interfaces/inqus/inqus.dart';
import 'package:flutter_inqus/src/interfaces/inqus/inqus_text.dart';
import 'package:flutter_inqus/src/interfaces/serializer.dart';
import 'package:flutter_inqus/src/services/dispatcher/inqus_dispatcher.dart';

class InqusSerializer extends Serializer<Inqus> {
  @override
  InqusEntity fromMap(Map<String, dynamic> map) {
    return InqusEntity(
      title: map['title'] != null ? InqusDispatcher.serialization.deserialize<InqusText>(map['title']) : null,
      description:
          map['description'] != null ? InqusDispatcher.serialization.deserialize<InqusText>(map['description']) : null,
      //TODO
      pages: map['pages'] != null ? [] : null,
      elements:
          map['elements'] != null
              ? (map['elements'] as List)
                  .map((element) => InqusDispatcher.serialization.deserialize<InqusElement>(element))
                  .toList()
              : null,
    );
  }

  @override
  Map<String, dynamic> toMap(Inqus instance) {
    return {
      'title': instance.title != null ? InqusDispatcher.serialization.serialize(instance.title!) : null,
      'description':
          instance.description != null ? InqusDispatcher.serialization.serialize(instance.description!) : null,
      //TODO
      'pages': [],
      'elements':
          instance.pages.length == 1
              ? instance.pages.first.elements
                  ?.map((element) => InqusDispatcher.serialization.serialize(element))
                  .toList()
              : null,
    };
  }
}
