import '../../domain/entities/payment_process_entity.dart';

abstract class PaymentDatasource {
  Stream<PaymentProcessEntity> payment(String name);
}
