import 'dart:convert';

import 'tip.dart';

class AmountDetails {
  Tip? tip;

  AmountDetails({this.tip});

  factory AmountDetails.fromMap(Map<String, dynamic> data) => AmountDetails(
        tip: data['tip'] == null
            ? null
            : Tip.fromMap(data['tip'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'tip': tip?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AmountDetails].
  factory AmountDetails.fromJson(String data) {
    return AmountDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AmountDetails] to a JSON string.
  String toJson() => json.encode(toMap());
}
