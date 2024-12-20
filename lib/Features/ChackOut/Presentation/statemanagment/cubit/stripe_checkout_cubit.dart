// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:payment_service/Features/ChackOut/domain/repository/checkout_rep.dart';

import '../../../data/models/payment_intent_input_model.dart';

part 'stripe_checkout_state.dart';

class StripeCheckoutCubit extends Cubit<StripeCheckoutState> {
  StripeCheckoutCubit(
    this.checkoutRep,
  ) : super(StripeCheckoutInitial());
  final CheckoutRep checkoutRep;

  Future makeStripePayment(
      {required PaymentIntentInputModel payment_intent_input_model}) async {
    emit(StripeCheckoutLoading());
    var result = await checkoutRep.makePayment(
        paymentIntentInputModel: payment_intent_input_model);
    result.fold((l) => emit(StripeCheckoutFailed(l.errmassagel)),
        (r) => emit(StripeCheckoutSuccess()));
  }

  @override
  void onChange(Change<StripeCheckoutState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
