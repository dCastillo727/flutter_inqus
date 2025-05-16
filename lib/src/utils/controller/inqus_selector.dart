import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inqus/src/interfaces/inqus/controller/inqus_controller_interface.dart';
import 'package:flutter_inqus/src/interfaces/inqus/inqus.dart';
import 'package:flutter_inqus/src/utils/controller/inqus_listener.dart';
import 'package:provider/provider.dart';

typedef InqusWidgetBuilder<T> = Widget Function(BuildContext context, T state);

typedef InqusWidgetSelector<T> = T Function(Inqus inqus);

class InqusSelector<T> extends StatefulWidget {
  const InqusSelector({super.key, required this.selector, required this.builder, this.controller});

  final InqusControllerInterface? controller;

  final InqusWidgetSelector<T> selector;

  final InqusWidgetBuilder<T> builder;

  @override
  State<InqusSelector<T>> createState() => _InqusSelectorState<T>();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<InqusControllerInterface?>('inqus', controller))
      ..add(ObjectFlagProperty<InqusWidgetSelector<T>>.has('selector', selector))
      ..add(ObjectFlagProperty<InqusWidgetBuilder<T>>.has('builder', builder));
  }
}

class _InqusSelectorState<T> extends State<InqusSelector<T>> {
  late InqusControllerInterface _controller;

  late T _state;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? context.read<InqusControllerInterface>();
    _state = widget.selector(_controller.inqus);
  }

  @override
  void didUpdateWidget(covariant InqusSelector<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldController = oldWidget.controller ?? context.read<InqusControllerInterface>();
    final currentController = widget.controller ?? context.read<InqusControllerInterface>();

    if (oldController != currentController) {
      _controller = currentController;
      _state = widget.selector(_controller.inqus);
    } else if (oldWidget.selector != widget.selector) {
      _state = widget.selector(_controller.inqus);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controller = widget.controller ?? context.read<InqusControllerInterface>();
    if (_controller != controller) {
      _controller = controller;
      _state = widget.selector(_controller.inqus);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller == null) {
      context.select<InqusControllerInterface, bool>((controller) => identical(_controller, controller));
    }

    return InqusListener(
      controller: _controller,
      listener: (context, inqus) {
        final selectedState = widget.selector(inqus);
        if (_state != selectedState && !identical(_state, selectedState)) setState(() => _state = selectedState);
      },
      child: widget.builder(context, _state),
    );
  }
}
