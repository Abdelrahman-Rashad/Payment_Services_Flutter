import 'package:dartz/dartz.dart';
import 'package:payment_service/Core/utiles/StripeServices.dart';
import 'package:payment_service/Core/utiles/failure.dart';
import 'package:payment_service/Features/ChackOut/data/models/payment_intent_input_model.dart';
import 'package:payment_service/Features/ChackOut/domain/repository/checkout_rep.dart';

class CheckoutRepImpl extends CheckoutRep {
  Stripeservices stripeservices = Stripeservices();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeservices.makePayment(
          payment_intent_input_model: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServierFailure(e.toString()));
    }
  }
}
