import 'package:flutter/material.dart';
import 'package:flutter_inqus/flutter_inqus.dart';

void main() {
  final text = TextEntity.localized(
    defaultText: 'Hello World!',
    translations: {'en': 'Hello World!', 'es': 'Hola Mundo!'},
  );
  print(InqusDispatcher.serialization.serialize(text));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: Center(child: Text('Hello World!'))));
  }
}
