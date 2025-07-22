import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../entities/payment_process_entity.dart';

abstract class PaymentUsecasePayment {
  Future<Either<Failure, Stream<PaymentProcessEntity>>> call(String name);
}
