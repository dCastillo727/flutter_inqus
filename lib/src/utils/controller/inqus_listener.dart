import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inqus/src/controllers/inqus-controller/inqus_controller.dart';
import 'package:flutter_inqus/src/interfaces/inqus/inqus_interface.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

typedef InqusWidgetListener = void Function(BuildContext context, InqusInterface inqus);

typedef InqusListenerCondition = bool Function(InqusInterface previous, InqusInterface current);

abstract class InqusListenerBase extends SingleChildStatefulWidget {
  const InqusListenerBase({
    required this.listener, //
    super.key,
    this.controller,
    super.child,
    this.listenWhen,
  });

  final InqusController? controller;

  final InqusWidgetListener listener;

  final InqusListenerCondition? listenWhen;

  @override
  SingleChildState<InqusListenerBase> createState() => _InqusListenerBaseState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<InqusController?>('inqus controller', controller))
      ..add(ObjectFlagProperty<InqusWidgetListener>.has('listener', listener))
      ..add(ObjectFlagProperty<InqusListenerCondition>.has('listenWhen', listenWhen));
  }
}

class _InqusListenerBaseState extends SingleChildState<InqusListenerBase> {
  StreamSubscription<InqusInterface>? _subscription;

  late InqusController _controller;

  late InqusInterface _previousInqus;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? context.read<InqusController>();
    _previousInqus = _controller.inqus;
    _subscribe();
  }

  @override
  void didUpdateWidget(covariant InqusListenerBase oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldController = oldWidget.controller ?? context.read<InqusController>();
    final currentController = widget.controller ?? oldController;
    if (oldController != currentController) {
      if (_subscription != null) {
        _unsubscribe();
        _controller = currentController;
        _previousInqus = _controller.inqus;
      }
      _subscribe();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controller = widget.controller ?? context.read<InqusController>();
    if (_controller != controller) {
      if (_subscription != null) {
        _unsubscribe();
        _controller = controller;
        _previousInqus = _controller.inqus;
      }
      _subscribe();
    }
  }

  @override
  void dispose() {
    _unsubscribe();
    super.dispose();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    assert(child != null, '${widget.runtimeType} requires a child');

    if (widget.controller == null) {
      context.select<InqusController, bool>((controller) => identical(_controller, controller));
    }

    return child!;
  }

  void _subscribe() {
    _subscription = _controller.stream.listen((inqus) {
      if (!mounted) return;
      if (widget.listenWhen?.call(_previousInqus, inqus) ?? true) {
        widget.listener(context, inqus);
      }
      _previousInqus = inqus;
    });
  }

  void _unsubscribe() {
    _subscription?.cancel();
    _subscription = null;
  }
}

class InqusListener extends InqusListenerBase {
  const InqusListener({
    required super.listener, //
    super.key,
    super.controller,
    super.listenWhen,
    super.child,
  });
}
