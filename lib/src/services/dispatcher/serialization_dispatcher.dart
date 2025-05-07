import 'package:flutter_inqus/src/interfaces/inqus/inqus_interface.dart';
import 'package:flutter_inqus/src/interfaces/inqus/inqus_text.dart';
import 'package:flutter_inqus/src/interfaces/serializer.dart';
import 'package:flutter_inqus/src/utils/serializers/inqus_serializer.dart';
import 'package:flutter_inqus/src/utils/serializers/text_serializer.dart';

class SerializationDispatcher {
  //TODO: Add needed serializers here
  static final defaultSerializers = <_TypeHelper<dynamic>, Serializer<dynamic>>{
    _TypeHelper<Inqus>(): InqusSerializer(),
    _TypeHelper<InqusText>(): TextSerializer(),
  };

  final Map<_TypeHelper, Serializer> _serializers = defaultSerializers;

  Map<String, dynamic> serialize<T>(T instance) {
    final serializer = _getSerializer<T>();

    if (serializer == null) {
      throw Exception('No serializer found for type $T');
    }

    return serializer.toMap(instance);
  }

  T deserialize<T>(Map<String, dynamic> json) {
    final serializer = _getSerializer<T>();

    if (serializer == null) {
      throw Exception('No serializer found for type $T');
    }

    return serializer.fromMap(json);
  }

  Serializer? _getSerializer<T>() {
    Serializer? serializer;

    for (final key in _serializers.keys) {
      if (key.isSubtype<T>()) {
        serializer = _serializers[key];
        break;
      }
    }

    return serializer;
  }

  void replaceSerializer<T>(Serializer<T> serializer) {
    final keys = _serializers.keys.toList();

    for (var key in keys) {
      if (key.isSubtype<T>()) {
        _serializers[key] = serializer;
        return;
      }
    }

    throw Exception('No serializer found for type $T');
  }

  void replaceAll(Map<Type, Serializer> serializers) {
    for (final entry in serializers.entries) {
      final key = entry.key;
      final serializer = entry.value;
      bool foundReplacement = false;

      for (var k in _serializers.keys) {
        if (k.type == key) {
          _serializers[k] = serializer;
          foundReplacement = true;
          break;
        }
      }

      if (!foundReplacement) {
        throw Exception('No serializer found for type $key');
      }
    }
  }

  void resetSerializers() {
    _serializers
      ..clear()
      ..addAll(defaultSerializers);
  }
}

class _TypeHelper<T> {
  Type get type => T;

  bool isSubtype<S>([_TypeHelper<S>? type]) => _TypeHelper<S>() is _TypeHelper<T> || type is _TypeHelper<T>;
}
