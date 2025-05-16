import 'package:flutter_inqus/src/entity/question/question_text_entity.dart';
import 'package:flutter_inqus/src/interfaces/inqus/inqus_text.dart';
import 'package:flutter_inqus/src/interfaces/inqus/question/inqus_question.dart';
import 'package:flutter_inqus/src/interfaces/serializer.dart';
import 'package:flutter_inqus/src/services/dispatcher/inqus_dispatcher.dart';

class InqusQuestionTextSerializer extends Serializer<InqusQuestionText> {
  @override
  InqusQuestionText fromMap(covariant Map<String, dynamic> map) {
    return QuestionTextEntity(
      name: InqusDispatcher.serialization.deserialize<InqusText>(map['name']),
      title: map['title'] != null ? InqusDispatcher.serialization.deserialize<InqusText>(map['title']) : null,
      description:
          map['description'] != null ? InqusDispatcher.serialization.deserialize<InqusText>(map['description']) : null,
      isRequired: map['isRequired'] ?? false,
      readOnly: map['readOnly'] ?? false,
    );
  }

  @override
  Object toMap(InqusQuestionText instance) {
    return {
      'name': InqusDispatcher.serialization.serialize(instance.name),
      'title': instance.title != null ? InqusDispatcher.serialization.serialize(instance.title!) : null,
      'description':
          instance.description != null ? InqusDispatcher.serialization.serialize(instance.description!) : null,
      'isRequired': instance.isRequired,
      'readOnly': instance.readOnly,
    };
  }
}
