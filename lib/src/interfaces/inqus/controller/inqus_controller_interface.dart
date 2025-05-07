import 'package:flutter_inqus/src/interfaces/inqus/inqus_interface.dart';
import 'package:flutter_inqus/src/interfaces/json_origin_interface.dart';

abstract class InqusControllerInterface {
  InqusControllerInterface();

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  Stream<Inqus> get stream;

  Inqus get inqus;

  Future<void> initialize({InqusJsonOriginInterface? json}) async {
    if (json != null) {
      await convertJson(json: json);
    }

    _isInitialized = true;
  }

  Future<void> convertJson({required InqusJsonOriginInterface json});

  void dispose();
}
