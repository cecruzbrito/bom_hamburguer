import 'package:bom_hamburguer/core/mixins/padding_app.dart';
import 'package:flutter/material.dart';

class CoreScroll extends StatelessWidget with PaddingApp {
  CoreScroll({super.key, required this.child, this.padding, this.direction = Axis.vertical});
  final Widget child;
  final EdgeInsets? padding;
  final Axis direction;
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(padding: padding ?? paddingScrollDefault, scrollDirection: direction, child: child),
    );
  }
}
