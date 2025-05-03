import 'package:flutter_inqus/src/entity/text_entity.dart';
import 'package:flutter_inqus/src/interfaces/serializer.dart';

class TextSerializer extends Serializer<TextEntity> {
  @override
  Map<String, String> toMap(TextEntity instance) {
    assert(instance.translations != null, 'Translations map should not be null when converting to TextEntity map.');
    return {'default': instance.defaultText, ...instance.translations!};
  }

  @override
  TextEntity fromMap(Map<String, dynamic> map) {
    final defaultText = map['default'];

    assert(defaultText != null, 'Default text should not be null when converting from TextEntity Map.');

    final translations = Map<String, String>.from(map)..remove('default');

    return TextEntity.localized(defaultText: defaultText!, translations: translations);
  }
}
