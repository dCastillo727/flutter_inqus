import 'dart:async';

import 'package:flutter_inqus/src/entity/inqus.dart';
import 'package:flutter_inqus/src/interfaces/inqus/inqus_interface.dart';

class InqusController {
  InqusController() {
    //TODO add initialization
    _inqus = InqusEntity();
  }

  final StreamController<InqusInterface> _inqusController = StreamController<InqusInterface>.broadcast();

  Stream<InqusInterface> get stream => _inqusController.stream;

  late InqusInterface _inqus;

  InqusInterface get inqus => _inqus;

  void dispose() {}
}
