import 'dart:convert';

class AutomaticPaymentMethods {
  bool? enabled;

  AutomaticPaymentMethods({this.enabled});

  factory AutomaticPaymentMethods.fromMap(Map<String, dynamic> data) {
    return AutomaticPaymentMethods(
      enabled: data['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'enabled': enabled,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AutomaticPaymentMethods].
  factory AutomaticPaymentMethods.fromJson(String data) {
    return AutomaticPaymentMethods.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AutomaticPaymentMethods] to a JSON string.
  String toJson() => json.encode(toMap());
}
