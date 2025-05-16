import 'package:flutter_inqus/src/entity/text_entity.dart';
import 'package:flutter_inqus/src/interfaces/serializer.dart';

class TextSerializer extends Serializer<TextEntity> {
  @override
  Object toMap(TextEntity instance) {
    if (instance.isString) {
      return instance.defaultText;
    }

    return {'default': instance.defaultText, ...instance.translations!};
  }

  @override
  TextEntity fromMap(dynamic map) {
    if (map is String) {
      return TextEntity(map);
    }

    final defaultText = map['default'];

    assert(defaultText != null, 'Default text should not be null when converting from TextEntity Map.');

    final translations = Map<String, String>.from(map)..remove('default');

    return TextEntity.localized(defaultText: defaultText!, translations: translations);
  }
}
