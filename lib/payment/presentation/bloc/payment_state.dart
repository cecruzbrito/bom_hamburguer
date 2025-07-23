part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaymentLoading extends PaymentState {
  final String msg;

  PaymentLoading(this.msg);
  @override
  List<Object?> get props => [msg];
}

class PaymentStarted extends PaymentState {}

class PaymentError extends PaymentState {
  final String msg;

  PaymentError({required this.msg});

  @override
  List<Object?> get props => [msg];
}

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
