import 'package:flutter_inqus/src/services/dispatcher/serialization_dispatcher.dart';

//TODO centralize needed dispatchers functionalities here
class InqusDispatcher {
  InqusDispatcher._();

  static final SerializationDispatcher _serializationDispatcher = SerializationDispatcher();

  static SerializationDispatcher get serialization => _serializationDispatcher;
}
