import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_service/Core/utiles/APIKey.dart';
import 'Features/ChackOut/Presentation/Views/MyCartView.dart';

void main() async {
  Stripe.publishableKey = APIKey.Publickey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}
