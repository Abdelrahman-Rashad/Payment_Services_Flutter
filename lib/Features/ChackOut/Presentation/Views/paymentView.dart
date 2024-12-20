import 'package:flutter/material.dart';

import '../../../../Core/widgets/build_appbar.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../components/CustomCreditCard.dart';
import '../components/PaymentMethods.dart';
import 'successView.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar("Payment Details", context),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Paymentmethods(),
          ),
          SliverToBoxAdapter(
            child: CustomCreditCard(
              formKey: formKey,
              autovalidateMode: autovalidateMode,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
                alignment: Alignment.center,
                child: CustomButton(
                    text: 'Pay',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SuccessView()));
                      }
                    })),
          )
        ],
      ),
    );
  }
}
