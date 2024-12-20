import 'dart:convert';

import 'associated_object.dart';

class EhpeKey {
  String? id;
  String? object;
  List<AssociatedObject>? associatedObjects;
  int? created;
  int? expires;
  bool? livemode;
  String? secret;

  EhpeKey({
    this.id,
    this.object,
    this.associatedObjects,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
  });

  factory EhpeKey.fromMap(Map<String, dynamic> data) => EhpeKey(
        id: data['id'] as String?,
        object: data['object'] as String?,
        associatedObjects: (data['associated_objects'] as List<dynamic>?)
            ?.map((e) => AssociatedObject.fromMap(e as Map<String, dynamic>))
            .toList(),
        created: data['created'] as int?,
        expires: data['expires'] as int?,
        livemode: data['livemode'] as bool?,
        secret: data['secret'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'object': object,
        'associated_objects': associatedObjects?.map((e) => e.toMap()).toList(),
        'created': created,
        'expires': expires,
        'livemode': livemode,
        'secret': secret,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EhpeKey].
  factory EhpeKey.fromJson(Map<String, dynamic> data) {
    return EhpeKey.fromMap(data);
  }

  /// `dart:convert`
  ///
  /// Converts [EhpeKey] to a JSON string.
  String toJson() => json.encode(toMap());
}
