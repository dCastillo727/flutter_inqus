import 'dart:async';
import 'dart:convert';

import 'package:flutter_inqus/src/interfaces/inqus/controller/inqus_controller_interface.dart';
import 'package:flutter_inqus/src/interfaces/inqus/inqus.dart';
import 'package:flutter_inqus/src/interfaces/json_origin_interface.dart';
import 'package:flutter_inqus/src/services/dispatcher/inqus_dispatcher.dart';

class InqusController extends InqusControllerInterface {
  InqusController();

  late final StreamController<Inqus> _inqusController = StreamController<Inqus>.broadcast()..stream.listen(updateInqus);
  @override
  Stream<Inqus> get stream => _inqusController.stream;

  late Inqus _inqus;
  @override
  Inqus get inqus => _inqus;

  @override
  Future<void> convertJson({required InqusJsonOriginInterface json}) async {
    final data = await json.getJson();
    //TODO remove delay
    await Future.delayed(const Duration(seconds: 2));
    final inqus = InqusDispatcher.serialization.deserialize<Inqus>(jsonDecode(data));
    _inqusController.add(inqus);
  }

  @override
  void dispose() {}

  void updateInqus(Inqus inqus) {
    _inqus = inqus;
  }
}
