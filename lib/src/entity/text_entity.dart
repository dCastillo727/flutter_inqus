import 'package:flutter/material.dart';
import 'package:flutter_inqus/src/interfaces/inqus/inqus_text.dart';
import 'package:flutter_inqus/src/services/dispatcher/inqus_dispatcher.dart';

class TextEntity extends InqusText {
  TextEntity(super.defaultText);

  TextEntity.localized({required super.defaultText, required super.translations}) : super.localized();

  @override
  String resolve(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode;

    return translations?[languageCode] ?? defaultText;
  }

  static InqusText? fromStringOrMap(dynamic value) {
    if (value is String) {
      return TextEntity(value);
    }

    if (value is Map<String, dynamic>) {
      return InqusDispatcher.serialization.deserialize<InqusText>(value);
    }

    if (value == null) {
      return null;
    }

    throw ArgumentError('Invalid value type for InqusText');
  }

  static Object? toStringOrMap(InqusText? value) {
    if (value == null) {
      return null;
    }

    if (value.isString) {
      return value.defaultText;
    }

    return InqusDispatcher.serialization.serialize(value);
  }
}
