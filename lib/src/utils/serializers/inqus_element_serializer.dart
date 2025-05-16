import 'package:flutter_inqus/src/entity/inqus_element_type.dart';
import 'package:flutter_inqus/src/interfaces/inqus/element/inqus_element.dart';
import 'package:flutter_inqus/src/interfaces/serializer.dart';
import 'package:flutter_inqus/src/services/dispatcher/inqus_dispatcher.dart';

class InqusElementSerializer extends Serializer<InqusElement> {
  @override
  InqusElement fromMap(covariant Map<String, dynamic> map) {
    final rawType = map['type'] as String;
    final type = InqusDispatcher.serialization.deserialize<InqusElementType>(rawType);
    return type.deserialize(map);
  }

  @override
  Object toMap(InqusElement instance) {
    final serialized = instance.type.serialize(instance);
    return {'type': InqusDispatcher.serialization.serialize(instance.type), ...serialized};
  }
}
