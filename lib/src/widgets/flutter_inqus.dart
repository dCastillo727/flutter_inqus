import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inqus/src/interfaces/inqus/controller/inqus_controller_interface.dart';
import 'package:flutter_inqus/src/interfaces/json_origin_interface.dart';
import 'package:flutter_inqus/src/utils/controller/inqus_controller_provider.dart';
import 'package:flutter_inqus/src/widgets/flutter_inqus_form.dart';

class FlutterInqus extends StatefulWidget {
  const FlutterInqus({
    super.key,
    this.json,
    required this.controller,
    this.body,
    this.onCompleted,
    this.loadingBuilder,
  });

  final InqusJsonOriginInterface? json;

  final InqusControllerInterface controller;

  final FlutterInqusForm? body;

  final void Function(Map<String, dynamic> result)? onCompleted;

  final WidgetBuilder? loadingBuilder;

  @override
  State<FlutterInqus> createState() => _FlutterInqusState();
}

class _FlutterInqusState extends State<FlutterInqus> {
  final Completer<void> _initCompleter = Completer<void>();
  late final InqusControllerInterface _controller;

  @override
  void initState() {
    super.initState();

    assert(
      widget.json != null || widget.body != null,
      'Either json data, InqusController or FlutterInqusForm body must be provided to use FlutterInqus.',
    );

    assert(widget.json == null || widget.body == null, 'You cannot provide both json and body at the same time.');

    _controller = widget.controller;
    init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initCompleter.future, //
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return widget.loadingBuilder?.call(context) ?? const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        return InqusControllerProvider(
          create: (_) => _controller, //
          child: widget.body ?? const FlutterInqusForm(),
        );
      },
    );
  }

  void init() async {
    if (!_controller.isInitialized) {
      await _controller.initialize(json: widget.json);
    }

    _initCompleter.complete();
  }
}
