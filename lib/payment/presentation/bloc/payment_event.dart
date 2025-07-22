part of 'payment_bloc.dart';

abstract class PaymentEvent {}

class InputName extends PaymentEvent {
  final String name;

  InputName({required this.name});
}

class UpdatePaymentProcess extends PaymentEvent {
  final PaymentProcessEntity paymentProcess;

  UpdatePaymentProcess(this.paymentProcess);
}
