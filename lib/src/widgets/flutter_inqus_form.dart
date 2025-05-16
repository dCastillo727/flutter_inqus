import 'package:flutter/material.dart';
import 'package:flutter_inqus/src/controllers/inqus-controller/inqus_controller.dart';
import 'package:flutter_inqus/src/interfaces/inqus/controller/inqus_controller_interface.dart';
import 'package:flutter_inqus/src/utils/controller/inqus_selector.dart';
import 'package:provider/provider.dart';

class FlutterInqusForm extends StatelessWidget {
  const FlutterInqusForm({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      final controller = context.read<InqusControllerInterface>();
      return _FlutterInqusFormView(controller: controller);
    } on ProviderNotFoundException catch (e) {
      if (e.valueType == InqusControllerInterface) {
        return _FlutterInqusFormView(controller: InqusController());
      }

      rethrow;
    }
  }
}

class _FlutterInqusFormView extends StatefulWidget {
  const _FlutterInqusFormView({required this.controller});

  final InqusControllerInterface controller;

  @override
  State<_FlutterInqusFormView> createState() => _FlutterInqusFormViewState();
}

class _FlutterInqusFormViewState extends State<_FlutterInqusFormView> {
  @override
  Widget build(BuildContext context) {
    return InqusSelector(
      selector: (inqus) => inqus.pages,
      builder: (context, state) => state.length == 1 ? Container(color: Colors.red) : Container(color: Colors.blue),
    );
  }
}
