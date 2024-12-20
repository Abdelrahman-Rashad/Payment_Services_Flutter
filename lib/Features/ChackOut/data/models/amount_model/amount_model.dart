import 'dart:convert';

import 'details.dart';

class AmountModel {
  String? total;
  String? currency;
  Details? details;

  AmountModel({this.total, this.currency, this.details});

  factory AmountModel.fromMap(Map<String, dynamic> data) => AmountModel(
        total: data['total'] as String?,
        currency: data['currency'] as String?,
        details: data['details'] == null
            ? null
            : Details.fromMap(data['details'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'total': total,
        'currency': currency,
        'details': details?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AmountModel].
  factory AmountModel.fromJson(String data) {
    return AmountModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AmountModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
