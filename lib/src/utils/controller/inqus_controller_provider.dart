import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inqus/src/controllers/inqus-controller/inqus_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class InqusControllerProvider extends SingleChildStatelessWidget {
  const InqusControllerProvider({required Create<InqusController> create, super.key, super.child, this.lazy = true})
    : _create = create,
      _value = null;

  const InqusControllerProvider.value({required InqusController value, super.key, super.child})
    : _create = null,
      _value = value,
      lazy = true;

  final bool lazy;

  final Create<InqusController>? _create;

  final InqusController? _value;

  static InqusController of(BuildContext context, {bool listen = true}) {
    try {
      return Provider.of<InqusController>(context, listen: listen);
    } on ProviderNotFoundException catch (e) {
      if (e.valueType != InqusController) rethrow;

      throw FlutterError(
        'InqusControllerProvider.of() called with a context that does not contain a InqusController.\n'
        'No InqusControllerProvider found in context.\n'
        'This can happen if you are trying to access the InqusController before it has been created.\n'
        'The context used was: $context',
      );
    }
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    final value = _value;
    return value != null
        ? InheritedProvider<InqusController>.value(value: value, lazy: lazy, child: child)
        : InheritedProvider<InqusController>(
          create: _create,
          dispose: (context, value) => value.dispose(),
          startListening: _startListening,
          lazy: lazy,
          child: child,
        );
  }

  static VoidCallback _startListening(InheritedContext<InqusController?> context, InqusController value) {
    final subscription = value.stream.listen((_) => context.markNeedsNotifyDependents());

    return subscription.cancel;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(DiagnosticsProperty<bool>('lazy', lazy));
  }
}
