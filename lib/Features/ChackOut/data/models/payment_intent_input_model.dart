// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;
  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    required this.customerId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'currency': currency,
      'customer': customerId
    };
  }

  factory PaymentIntentInputModel.fromMap(Map<String, dynamic> map) {
    return PaymentIntentInputModel(
      amount: map['amount'] as String,
      currency: map['currency'] as String,
      customerId: map['customer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentIntentInputModel.fromJson(String source) =>
      PaymentIntentInputModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
