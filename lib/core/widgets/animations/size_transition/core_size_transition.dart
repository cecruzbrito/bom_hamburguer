// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CoreSizeTransition extends StatefulWidget {
  const CoreSizeTransition({super.key, required this.child, required this.duration});
  final Widget child;
  final Duration duration;

  @override
  State<CoreSizeTransition> createState() => _CoreSizeTransitionState();
}

class _CoreSizeTransitionState extends State<CoreSizeTransition> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(duration: widget.duration, vsync: this)..forward();
  late final Animation<double> _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(sizeFactor: _animation, axisAlignment: -1, child: widget.child);
  }
}
