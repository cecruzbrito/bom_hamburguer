import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../entities/home_response_entity.dart';
import '../../entities/product_entity.dart';

abstract class MenuUsecaseGetProducts {
  Future<Either<Failure, HomeResponseEntity>> call();
}
