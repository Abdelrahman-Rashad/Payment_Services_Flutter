import 'dart:convert';

class ItemOrderModel {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemOrderModel({this.name, this.quantity, this.price, this.currency});

  factory ItemOrderModel.fromMap(Map<String, dynamic> data) => ItemOrderModel(
        name: data['name'] as String?,
        quantity: data['quantity'] as int?,
        price: data['price'] as String?,
        currency: data['currency'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ItemOrderModel].
  factory ItemOrderModel.fromJson(Map<String, dynamic> data) {
    return ItemOrderModel.fromMap(data);
  }

  /// `dart:convert`
  ///
  /// Converts [ItemOrderModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
