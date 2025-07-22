part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaymentLoading extends PaymentState {}

class PaymentStarted extends PaymentState {}

class PaymentProcess extends PaymentState {
  final PaymentProcessEntity paymentProcess;
  PaymentProcess(this.paymentProcess);

  @override
  List<Object?> get props => [paymentProcess];
}

class PaymentFinished extends PaymentState {
  final PaymentProcessEntity paymentProcess;
  PaymentFinished(this.paymentProcess);

  @override
  List<Object?> get props => [paymentProcess];
}
