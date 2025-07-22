import 'package:bom_hamburguer/payment/domain/entities/payment_process_entity.dart';
import 'package:bom_hamburguer/payment/infra/datasource/payment_datasource.dart';

class PaymentDatasourceImp implements PaymentDatasource {
  @override
  Stream<PaymentProcessEntity> payment(String name) async* {
    final initial = PaymentProcessEntity.initializing(name);
    await Future.delayed(Duration(seconds: 1));
    for (var s in PaymentStatus.values) {
      yield initial.copyWith(status: s);
      await Future.delayed(Duration(seconds: 2));
    }
  }
}
