import 'package:flutter/material.dart';

abstract class InqusText {
  InqusText(this.defaultText) {
    translations = {};
  }

  InqusText.localized({required this.defaultText, required this.translations});

  final String defaultText;
  late final Map<String, String>? translations;

  String resolve(BuildContext context);

  String resolveWithLocale(String locale) {
    return translations?[locale] ?? defaultText;
  }
}
