import 'package:flutter_inqus/src/interfaces/inqus/inqus_text.dart';
import 'package:flutter_inqus/src/interfaces/serializer.dart';
import 'package:flutter_inqus/src/utils/serializers/text_serializer.dart';

class SerializationDispatcher {
  //TODO: Add needed serializers here
  static final defaultSerializers = {_TypeHelper<InqusText>(): TextSerializer()};

  final Map<_TypeHelper, Serializer> _serializers = defaultSerializers;

  String serialize<T>(T instance) {
    final serializer = _getSerializer<T>();

    if (serializer == null) {
      throw Exception('No serializer found for type $T');
    }

    return serializer.toJson(instance);
  }

  T deserialize<T>(String json) {
    final serializer = _getSerializer<T>();

    if (serializer == null) {
      throw Exception('No serializer found for type $T');
    }

    return serializer.fromJson(json);
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

  void resetSerializers() {
    _serializers
      ..clear()
      ..addAll(defaultSerializers);
  }
}

class _TypeHelper<T> {
  bool isSubtype<S>() => _TypeHelper<S>() is _TypeHelper<T>;
}
