import 'package:flutter/material.dart';
import 'package:flutter_inqus/src/controllers/inqus-controller/inqus_controller.dart';
import 'package:flutter_inqus/src/interfaces/json_origin_interface.dart';
import 'package:flutter_inqus/src/utils/controller/inqus_controller_provider.dart';
import 'package:flutter_inqus/src/widgets/flutter_inqus_form.dart';

class FlutterInqus extends StatefulWidget {
  const FlutterInqus({super.key, this.json, this.controller, this.body, this.onCompleted});

  final InqusJsonOriginInterface? json;

  final InqusController? controller;

  final FlutterInqusForm? body;

  final void Function(Map<String, dynamic> result)? onCompleted;

  @override
  State<FlutterInqus> createState() => _FlutterInqusState();
}

class _FlutterInqusState extends State<FlutterInqus> {
  late final InqusController _controller;

  @override
  void initState() {
    super.initState();

    assert(
      widget.json != null || widget.controller != null || widget.body != null,
      'Either json data, InqusController or FlutterInqusForm body must be provided to use FlutterInqus.',
    );

    assert(widget.json == null || widget.body == null, 'You cannot provide both json and body at the same time.');

    _controller = widget.controller ?? InqusController();
  }

  @override
  Widget build(BuildContext context) {
    return InqusControllerProvider(create: (_) => _controller, child: Container());
  }
}
