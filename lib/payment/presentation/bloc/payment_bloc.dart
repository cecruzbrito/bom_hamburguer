import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../menu/presentation/home/bloc/home_bloc.dart';
import '../../domain/entities/payment_process_entity.dart';
import '../../domain/usecases/payment/payment_usecase_payment.dart';

part "payment_event.dart";
part "payment_state.dart";

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentUsecasePayment _usecasePayment;
  final HomeBloc _homeBloc;
  PaymentBloc(this._usecasePayment, this._homeBloc) : super(PaymentStarted()) {
    on<InputName>(_inputName);
    on<UpdatePaymentProcess>(_updatePaymentProcess);
  }

  Future<void> _inputName(InputName event, Emitter<PaymentState> emit) async {
    emit(PaymentLoading("Initializing payment"));
    final response = await _usecasePayment(event.name);
    response.fold((l) => emit(PaymentError(msg: l.msg)), (r) {
      r.listen(_updatingStatus, onError: (l) => PaymentError(msg: "$l"));
    });
  }

  void _updatingStatus(PaymentProcessEntity e) => add(UpdatePaymentProcess(e));

  void _updatePaymentProcess(UpdatePaymentProcess event, Emitter<PaymentState> emit) {
    if (event.paymentProcess.status.hasCompleted) {
      _homeBloc.add(CompleteSale());
      return emit(PaymentFinished(event.paymentProcess));
    }
    emit(PaymentProcess(event.paymentProcess));
  }
}
