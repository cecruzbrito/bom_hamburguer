// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../domain/entities/payment_process_entity.dart';

class PaymentStatusWidget extends StatefulWidget {
  const PaymentStatusWidget({super.key, required this.status});
  final PaymentStatus status;

  @override
  State<PaymentStatusWidget> createState() => _PaymentStatusWidgetState();
}

class _PaymentStatusWidgetState extends State<PaymentStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 15,
        children: [
          WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(),
            outgoingEffect: WidgetTransitionEffects.incomingOffsetThenScale(),
            atRestEffect: WidgetRestingEffects.wave(),
            child: Image.asset(widget.status.sticker, height: 100, width: 100, key: ValueKey(widget.status.sticker)),
          ),
          TextAnimator(
            widget.status.desc,
            incomingEffect: WidgetTransitionEffects.incomingOffsetThenScale(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
