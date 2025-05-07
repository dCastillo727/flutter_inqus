import 'package:flutter/material.dart';

abstract class InqusText {
  InqusText.localized({required this.defaultText, required this.translations});

  InqusText(this.defaultText) {
    translations = {};
  }

  bool get isString => translations == null;

  final String defaultText;
  late final Map<String, String>? translations;

  String resolve(BuildContext context);

  String resolveWithLocale(String locale) {
    return translations?[locale] ?? defaultText;
  }
}
