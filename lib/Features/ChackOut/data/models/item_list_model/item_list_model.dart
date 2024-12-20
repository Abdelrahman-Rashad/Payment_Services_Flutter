import 'dart:convert';

import 'item.dart';

class ItemListModel {
  List<ItemOrderModel>? orders;

  ItemListModel({required this.orders});

  factory ItemListModel.fromMap(Map<String, dynamic> data) => ItemListModel(
        orders: (data['items'] as List<dynamic>?)
            ?.map((e) => ItemOrderModel.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'items': orders?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ItemListModel].
  factory ItemListModel.fromJson(Map<String, dynamic> data) {
    return ItemListModel.fromMap(data);
  }

  /// `dart:convert`
  ///
  /// Converts [ItemListModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
