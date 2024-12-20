import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_service/Core/utiles/APIKey.dart';
import 'package:payment_service/Features/ChackOut/data/models/ehpe_key/ehpe_key.dart';

import '../../Features/ChackOut/data/models/init_payment_input_model.dart';
import '../../Features/ChackOut/data/models/payment_intent_input_model.dart';
import '../../Features/ChackOut/data/models/payment_intent_model/payment_intent_model.dart';
import 'DioServices.dart';

class Stripeservices {
  Dioservices dioservices = Dioservices();

  Future<PaymentIntentModel> CreatePaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var result = await dioservices.post(
        body: paymentIntentInputModel.toMap(),
        url: 'https://api.stripe.com/v1/payment_intents',
        contentType: Headers.formUrlEncodedContentType,
        token: APIKey.Secretkey);
    var paymentIntentModel = PaymentIntentModel.fromJson(result.data);
    return paymentIntentModel;
  }

  Future<EhpeKey> CreateEhpeKey(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var result = await dioservices.post(
        body: {'customer': paymentIntentInputModel.customerId},
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        contentType: Headers.formUrlEncodedContentType,
        token: APIKey.Secretkey,
        headers: {
          "Authorization": "Bearer ${APIKey.Secretkey}",
          "Stripe-Version": "2024-11-20.acacia"
        });
    var ehpe_key = EhpeKey.fromJson(result.data);
    return ehpe_key;
  }

  Future<void> initPaymentSheet(
      {required InitPaymentInputModel initPaymentInputModel}) async {
    // 2. initialize the payment sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          // Main params
          merchantDisplayName: 'Rashad',
          paymentIntentClientSecret:
              initPaymentInputModel.paymentIntentClientSecret,
          customerId: initPaymentInputModel.customerId,
          customerEphemeralKeySecret: initPaymentInputModel.ehpe_key),
    );
  }

  Future presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel payment_intent_input_model}) async {
    var paymentIntentModel =
        await CreatePaymentIntent(payment_intent_input_model);
    var ehpe_key = await CreateEhpeKey(payment_intent_input_model);
    InitPaymentInputModel initPaymentInputModel = InitPaymentInputModel(
        paymentIntentModel.clientSecret!,
        payment_intent_input_model.customerId,
        ehpe_key.secret!);
    await initPaymentSheet(initPaymentInputModel: initPaymentInputModel);
    await presentPaymentSheet();
  }
}
