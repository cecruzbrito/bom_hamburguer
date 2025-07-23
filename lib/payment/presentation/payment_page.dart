import 'package:bom_hamburguer/core/mixins/padding/padding_app.dart';
import 'package:bom_hamburguer/core/router/app_router.dart';
import 'package:bom_hamburguer/core/widgets/field/core_text_field.dart';
import 'package:bom_hamburguer/core/widgets/loading/core_loading.dart';
import 'package:bom_hamburguer/core/widgets/scroll/core_scroll.dart';
import 'package:bom_hamburguer/payment/presentation/bloc/payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/mixins/validators/validators.dart';
import '../../core/widgets/error/core_error_widget.dart';
import 'widget/payment_status_widget.dart';
import 'widget/payment_success_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> with Validators, PaddingApp {
  final ctrName = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Container()),
      body: BlocBuilder<PaymentBloc, PaymentState>(
        bloc: context.read(),

        builder: (_, state) {
          if (state is PaymentLoading) {
            return PopScope(canPop: false, child: CoreLoading());
          }

          if (state is PaymentError) {
            return PopScope(
              canPop: false,
              child: CoreErrorWidget(
                desc: state.msg,
                title: "Error",
                type: TypeError.warning,
                button: ButtonEntity(
                  icon: Icons.shopping_cart,
                  label: "Back to Cart",
                  onTap: () => AppRouter.go("/cart"),
                ),
              ),
            );
          }

          if (state is PaymentStarted) {
            return Center(
              child: CoreScroll(
                child: Form(
                  key: formKey,
                  child: Column(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order Identification", style: Theme.of(context).textTheme.headlineMedium),
                      Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CoreTextField(
                            validator: validatorEmpty,
                            hint: "Name for the order",
                            label: "Name",
                            ctr: ctrName,
                          ),
                          ElevatedButton.icon(
                            iconAlignment: IconAlignment.end,
                            onPressed: () {
                              if (formKey.currentState == null) return;
                              if (!formKey.currentState!.validate()) return;
                              context.read<PaymentBloc>().add(InputName(name: ctrName.text));
                            },
                            label: Text("Proceed"),
                            icon: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          if (state is PaymentProcess) {
            return PopScope(
              canPop: false,
              child: Padding(
                padding: paddingScrollDefault,
                child: PaymentStatusWidget(status: state.paymentProcess.status),
              ),
            );
          }

          if (state is PaymentFinished) {
            return PopScope(
              canPop: false,
              child: Padding(
                padding: paddingScrollDefault,
                child: PaymentSuccessWidget(nameCustomer: state.paymentProcess.customerName),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
