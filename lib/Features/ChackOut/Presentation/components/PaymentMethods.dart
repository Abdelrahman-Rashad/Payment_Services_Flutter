import 'package:flutter/material.dart';

import 'CustomPaymentMethod.dart';
import 'payment_consumer.dart';

class Paymentmethods extends StatefulWidget {
  const Paymentmethods({super.key});

  @override
  State<Paymentmethods> createState() => _PaymentmethodsState();
}

class _PaymentmethodsState extends State<Paymentmethods> {
  final List<String> paymentImages = [
    'assets/images/cardpay.svg',
    'assets/images/Group.svg',
    'assets/images/applepay.svg'
  ];
  int inActiveindex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: SizedBox(
            height: 62,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: paymentImages.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GestureDetector(
                          onTap: () {
                            inActiveindex = index;
                            setState(() {});
                          },
                          child: CustomPaymentMethod(
                              isActive: inActiveindex == index,
                              imageName: paymentImages[index])),
                    )),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        payment_consumer(
          payment_method: inActiveindex,
        )
      ],
    );
  }
}
