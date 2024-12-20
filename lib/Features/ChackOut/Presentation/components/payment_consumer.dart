// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_service/Core/utiles/APIKey.dart';
import 'package:payment_service/Features/ChackOut/Presentation/Views/successView.dart';
import 'package:payment_service/Features/ChackOut/data/models/amount_model/amount_model.dart';
import 'package:payment_service/Features/ChackOut/data/models/amount_model/details.dart';
import 'package:payment_service/Features/ChackOut/data/models/item_list_model/item.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../../data/models/item_list_model/item_list_model.dart';
import '../../data/models/payment_intent_input_model.dart';
import '../statemanagment/cubit/stripe_checkout_cubit.dart';

class payment_consumer extends StatelessWidget {
  const payment_consumer({
    Key? key,
    required this.payment_method,
  }) : super(key: key);
  final int payment_method;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripeCheckoutCubit, StripeCheckoutState>(
      listener: (context, state) {
        if (state is StripeCheckoutSuccess) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => SuccessView()));
        } else if (state is StripeCheckoutFailed) {
          Navigator.of(context).pop();
          // SnackBar snackBar = SnackBar(
          //   content: Text(state.errmassage),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          print(state.errmassage);
        }
      },
      builder: (context, state) {
        return state is StripeCheckoutLoading
            ? CircularProgressIndicator()
            : CustomButton(
                text: "Continue",
                onTap: () {
                  if (payment_method == 0) {
                    PaymentIntentInputModel paymentIntentInputModel =
                        PaymentIntentInputModel(
                            amount: "100",
                            currency: "USD",
                            customerId: 'cus_RR1T3zTcXjEP6L');
                    BlocProvider.of<StripeCheckoutCubit>(context)
                        .makeStripePayment(
                            payment_intent_input_model:
                                paymentIntentInputModel);
                  } else if (payment_method == 1) {
                    AmountModel amountModel = AmountModel(
                        currency: "USD",
                        details: Details(
                            shipping: "0", shippingDiscount: 0, subtotal: "70"),
                        total: "70");
                    List<ItemOrderModel> list = [
                      ItemOrderModel(
                          currency: "USD",
                          name: "Apple",
                          price: "5",
                          quantity: 4),
                      ItemOrderModel(
                          currency: "USD",
                          name: "Pineapple",
                          price: "10",
                          quantity: 5),
                    ];
                    ItemListModel itemListModel = ItemListModel(orders: list);

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => PaypalCheckoutView(
                        sandboxMode: true,
                        clientId: APIKey.ClientId,
                        secretKey: APIKey.PaypalSecretKey,
                        transactions: [
                          {
                            "amount": amountModel.toMap(),
                            "description":
                                "The payment transaction description.",
                            "item_list": itemListModel.toMap()
                          }
                        ],
                        note: "Contact us for any questions on your order.",
                        onSuccess: (Map params) async {
                          log("onSuccess: $params");
                          Navigator.pop(context);
                        },
                        onError: (error) {
                          log("onError: $error");
                          Navigator.pop(context);
                        },
                        onCancel: () {
                          log('cancelled:');
                          Navigator.pop(context);
                        },
                      ),
                    ));
                  }
                });
      },
    );
  }
}
