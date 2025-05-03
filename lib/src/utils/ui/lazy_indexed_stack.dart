import 'package:flutter/material.dart';

class LazyIndexedStack extends StatefulWidget {
  const LazyIndexedStack({
    super.key,
    required this.index,
    required this.children,
    this.alignment = Alignment.topCenter,
    this.clipBehavior = Clip.hardEdge,
    this.sizing = StackFit.loose,
    this.textDirection,
  });

  final int index;
  final AlignmentGeometry alignment;
  final Clip clipBehavior;
  final StackFit sizing;
  final TextDirection? textDirection;
  final List<Widget> children;

  @override
  State<LazyIndexedStack> createState() => _LazyIndexedStackState();
}

class _LazyIndexedStackState extends State<LazyIndexedStack> {
  late final List<bool> _loadedChildrens;

  @override
  void initState() {
    super.initState();
    _loadedChildrens = List.generate(widget.children.length, (index) => index == widget.index);
  }

  @override
  void didUpdateWidget(covariant LazyIndexedStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index && !_loadedChildrens[widget.index]) {
      _loadedChildrens[widget.index] = true;
    }
  }

  List<Widget> get children {
    return List.generate(
      widget.children.length,
      (index) => _loadedChildrens[index] ? widget.children[index] : const SizedBox.shrink(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: widget.index,
      alignment: widget.alignment,
      clipBehavior: widget.clipBehavior,
      sizing: widget.sizing,
      textDirection: widget.textDirection,
      children: children,
    );
  }
}
