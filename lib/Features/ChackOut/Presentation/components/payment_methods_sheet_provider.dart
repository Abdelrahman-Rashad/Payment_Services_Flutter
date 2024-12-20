import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_service/Features/ChackOut/Presentation/components/PaymentMethods.dart';
import '../../data/repository/checkout_rep_impl.dart';
import '../statemanagment/cubit/stripe_checkout_cubit.dart';

class PaymentMethodsSheet extends StatelessWidget {
  const PaymentMethodsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StripeCheckoutCubit(CheckoutRepImpl()),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Paymentmethods(),
          ],
        ),
      ),
    );
  }
}
