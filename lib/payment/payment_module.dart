import 'package:bom_hamburguer/payment/domain/usecases/payment/payment_usecase_payment.dart';
import 'package:bom_hamburguer/payment/external/datasource/payment_datasource_imp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/repository/payment_repository.dart';
import 'domain/usecases/payment/payment_usecase_payment_imp.dart';
import 'infra/datasource/payment_datasource.dart';
import 'infra/repository/payment_repository_imp.dart';
import 'presentation/bloc/payment_bloc.dart';

class PaymentModule {
  static final providers = [
    RepositoryProvider<PaymentDatasource>(create: (_) => PaymentDatasourceImp()),
    RepositoryProvider<PaymentRepository>(create: (context) => PaymentRepositoryImp(context.read())),
    RepositoryProvider<PaymentUsecasePayment>(create: (context) => PaymentUsecasePaymentImp(context.read())),
  ];

  static final blocs = [BlocProvider(create: (context) => PaymentBloc(context.read(), context.read()))];
}
