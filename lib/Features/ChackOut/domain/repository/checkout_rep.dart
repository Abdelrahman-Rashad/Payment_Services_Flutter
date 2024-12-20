import 'package:dartz/dartz.dart';

import '../../../../Core/utiles/failure.dart';
import '../../data/models/payment_intent_input_model.dart';

abstract class CheckoutRep {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
