import 'dart:convert';

import 'card.dart';
import 'link.dart';

class PaymentMethodOptions {
  Card? card;
  Link? link;

  PaymentMethodOptions({this.card, this.link});

  factory PaymentMethodOptions.fromMap(Map<String, dynamic> data) {
    return PaymentMethodOptions(
      card: data['card'] == null
          ? null
          : Card.fromMap(data['card'] as Map<String, dynamic>),
      link: data['link'] == null
          ? null
          : Link.fromMap(data['link'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'card': card?.toMap(),
        'link': link?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentMethodOptions].
  factory PaymentMethodOptions.fromJson(String data) {
    return PaymentMethodOptions.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PaymentMethodOptions] to a JSON string.
  String toJson() => json.encode(toMap());
}
