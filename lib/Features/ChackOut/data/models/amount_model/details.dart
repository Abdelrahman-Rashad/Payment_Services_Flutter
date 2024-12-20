import 'dart:convert';

class Details {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  factory Details.fromMap(Map<String, dynamic> data) => Details(
        subtotal: data['subtotal'] as String?,
        shipping: data['shipping'] as String?,
        shippingDiscount: data['shipping_discount'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Details].
  factory Details.fromJson(Map<String, dynamic> data) {
    return Details.fromMap(data);
  }

  /// `dart:convert`
  ///
  /// Converts [Details] to a JSON string.
  String toJson() => json.encode(toMap());
}
