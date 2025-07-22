import 'package:bom_hamburguer/core/errors/errors.dart';

import 'package:bom_hamburguer/payment/domain/entities/payment_process_entity.dart';
import 'package:bom_hamburguer/payment/infra/datasource/payment_datasource.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/payment_repository.dart';

class PaymentRepositoryImp implements PaymentRepository {
  final PaymentDatasource _datasource;

  PaymentRepositoryImp(this._datasource);
  @override
  Future<Either<Failure, Stream<PaymentProcessEntity>>> payment(String name) async {
    try {
      return Right(_datasource.payment(name));
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
