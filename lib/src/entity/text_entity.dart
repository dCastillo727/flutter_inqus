import 'package:flutter/material.dart';
import 'package:flutter_inqus/src/interfaces/inqus/inqus_text.dart';

class TextEntity extends InqusText {
  TextEntity(super.defaultText);

  TextEntity.localized({required super.defaultText, required super.translations}) : super.localized();

  @override
  String resolve(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode;

    return translations?[languageCode] ?? defaultText;
  }
}
