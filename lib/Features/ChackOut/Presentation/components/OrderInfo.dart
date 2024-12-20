import 'package:flutter/material.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo(
      {super.key,
      required this.order,
      required this.price,
      required this.style});

  final String order;
  final String price;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          order,
          textAlign: TextAlign.center,
          style: style,
        ),
        const Spacer(),
        Text(
          price,
          textAlign: TextAlign.center,
          style: style,
        )
      ],
    );
  }
}
