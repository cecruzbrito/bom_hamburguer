import 'package:bom_hamburguer/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../domain/entities/payment_process_entity.dart';

class PaymentSuccessWidget extends StatelessWidget {
  final String nameCustomer;
  const PaymentSuccessWidget({super.key, required this.nameCustomer});
  @override
  Widget build(BuildContext context) {
    final title = "Order Confirmed";
    final desc = "Thank you, $nameCustomer! Your order has been successfully placed and paid.";
    return Column(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingScaleUp(),
          child: Image.asset(PaymentStatus.completed.sticker, height: 100, width: 100),
        ),
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        Text(desc, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
        ElevatedButton.icon(onPressed: () => AppRouter.go("/"), icon: Icon(Icons.home), label: Text("Back to home")),
      ],
    );
  }
}
