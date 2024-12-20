import 'dart:convert';

class Card {
  dynamic installments;
  dynamic mandateOptions;
  dynamic network;
  String? requestThreeDSecure;

  Card({
    this.installments,
    this.mandateOptions,
    this.network,
    this.requestThreeDSecure,
  });

  factory Card.fromMap(Map<String, dynamic> data) => Card(
        installments: data['installments'] as dynamic,
        mandateOptions: data['mandate_options'] as dynamic,
        network: data['network'] as dynamic,
        requestThreeDSecure: data['request_three_d_secure'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'installments': installments,
        'mandate_options': mandateOptions,
        'network': network,
        'request_three_d_secure': requestThreeDSecure,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Card].
  factory Card.fromJson(String data) {
    return Card.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Card] to a JSON string.
  String toJson() => json.encode(toMap());
}
