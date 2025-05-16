import 'dart:convert';

abstract class Serializer<T> {
  Object toMap(T instance);

  T fromMap(covariant Object map);

  String toJson(T instance) => json.encode(toMap(instance));

  T fromJson(String source) => fromMap(json.decode(source));
}
