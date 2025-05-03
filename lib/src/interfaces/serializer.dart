import 'dart:convert';

abstract class Serializer<T> {
  Map<String, dynamic> toMap(T instance);

  T fromMap(Map<String, dynamic> map);

  String toJson(T instance) => json.encode(toMap(instance));

  T fromJson(String source) => fromMap(json.decode(source));
}
