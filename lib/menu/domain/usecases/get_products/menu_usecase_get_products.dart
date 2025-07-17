import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../entities/product_entity.dart';

abstract class MenuUsecaseGetProducts {
  Future<Either<Failure, List<ProductEntity>>> call();
}
