import 'package:dartz/dartz.dart';

import '../../../core/errors/errors.dart';
import '../entities/payment_process_entity.dart';

abstract class PaymentRepository {
  Future<Either<Failure, Stream<PaymentProcessEntity>>> payment(String name);
}
