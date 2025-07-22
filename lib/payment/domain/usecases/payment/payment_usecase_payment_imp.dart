import 'package:bom_hamburguer/payment/domain/repository/payment_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../entities/payment_process_entity.dart';
import 'payment_usecase_payment.dart';

class PaymentUsecasePaymentImp implements PaymentUsecasePayment {
  final PaymentRepository _repository;

  PaymentUsecasePaymentImp(this._repository);
  @override
  Future<Either<Failure, Stream<PaymentProcessEntity>>> call(String name) async => await _repository.payment(name);
}
