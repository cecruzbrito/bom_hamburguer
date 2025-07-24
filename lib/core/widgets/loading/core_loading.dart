import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class CoreLoading extends StatelessWidget {
  CoreLoading({super.key, this.text});
  final String? text;
  final texts = [
    "We're getting things ready for you...",
    "Good things take time!",
    "Thanks for your patience!",
    "Just a second, it's worth it!",
    "Preparing your experience...",
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.incomingScaleUp(),
            outgoingEffect: WidgetTransitionEffects.incomingOffsetThenScale(),
            atRestEffect: WidgetRestingEffects.size(effectStrength: .9),
            key: UniqueKey(),
            child: Image.asset("assets/icon_app/icon.png", height: 100, width: 100, fit: BoxFit.contain),
          ),
          TextAnimator(
            incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(duration: Duration(milliseconds: 500)),
            text ?? texts[Random().nextInt(texts.length)],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
