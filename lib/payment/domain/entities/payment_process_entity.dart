// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentProcessEntity {
  final String customerName;
  final PaymentStatus status;
  PaymentProcessEntity({required this.customerName, required this.status});

  factory PaymentProcessEntity.initializing(String name) =>
      PaymentProcessEntity(customerName: name, status: PaymentStatus.initiatingPayment);

  PaymentProcessEntity copyWith({String? customerName, PaymentStatus? status}) =>
      PaymentProcessEntity(customerName: customerName ?? this.customerName, status: status ?? this.status);
}

enum PaymentStatus {
  validatingCart,
  initiatingPayment,
  processingPayment,
  paymentApproved,
  completed;

  bool get hasCompleted => this == completed;

  String get desc => switch (this) {
    PaymentStatus.validatingCart => 'Validating your cart items...',
    PaymentStatus.initiatingPayment => 'Starting the payment process...',
    PaymentStatus.processingPayment => 'Waiting for payment confirmation...',
    PaymentStatus.paymentApproved => 'Payment successfully confirmed!',
    PaymentStatus.completed => 'Your order is complete!',
  };
}
