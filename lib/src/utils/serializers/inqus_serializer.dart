import 'package:flutter_inqus/src/entity/inqus_entity.dart';
import 'package:flutter_inqus/src/entity/question/question_text_entity.dart';
import 'package:flutter_inqus/src/entity/text_entity.dart';
import 'package:flutter_inqus/src/interfaces/serializer.dart';

class InqusSerializer extends Serializer<InqusEntity> {
  @override
  InqusEntity fromMap(Map<String, dynamic> map) {
    return InqusEntity(
      title: TextEntity.fromStringOrMap(map['title']),
      description: TextEntity.fromStringOrMap(map['description']),
      //TODO
      pages: [],
      elements: [QuestionTextEntity(name: TextEntity('hola'))],
    );
  }

  @override
  Map<String, dynamic> toMap(InqusEntity instance) {
    return {
      'title': TextEntity.toStringOrMap(instance.title),
      'description': TextEntity.toStringOrMap(instance.description),
      //TODO
      'pages': [],
      'elements': [],
    };
  }
}
