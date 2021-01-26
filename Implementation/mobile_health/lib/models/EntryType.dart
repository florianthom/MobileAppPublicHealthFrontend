import 'dart:convert';
import '../database/database_provider.dart';
import 'DBO.dart';

///class representing the type or type category of an event in a diary entry
class EntryType implements DBO {
  ///database id
  int id;

  /// name of this EntryType
  String name;

  /// description of this EntryType
  String description;

  /// id of the EntryType this instance is connected to
  int parentTypeId;
  EntryType({
    this.id,
    this.name,
    this.description,
    this.parentTypeId,
  });

  ///returns a copy of this object with the supplied values or the instance values
  EntryType copyWith({
    int id,
    String name,
    String description,
    int parentTypeId,
  }) {
    return EntryType(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      parentTypeId: parentTypeId ?? this.parentTypeId,
    );
  }

  ///returns a map of this object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_NAME: name,
      DatabaseProvider.COLUMN_DESCRIPTION: description,
      DatabaseProvider.COLUMN_PARENTTYPEID: parentTypeId,
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }

    return map;
  }

  ///generates an instance of this class from a map
  factory EntryType.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EntryType(
      id: map[DatabaseProvider.COLUMN_ID],
      name: map[DatabaseProvider.COLUMN_NAME],
      description: map[DatabaseProvider.COLUMN_DESCRIPTION],
      parentTypeId: map[DatabaseProvider.COLUMN_PARENTTYPEID],
    );
  }

  ///returns JSON-format string of this instance
  String toJson() => json.encode(toMap());

  ///generates instance of this class from a JSON-format string
  factory EntryType.fromJson(String source) =>
      EntryType.fromMap(json.decode(source));

  ///returns string representation of this object instance
  @override
  String toString() {
    return 'Type(id: $id, name: $name, description: $description, parentTypeId: $parentTypeId)';
  }

  /// checks for equality between two instances of this class
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EntryType &&
        o.id == id &&
        o.name == name &&
        o.description == description &&
        o.parentTypeId == parentTypeId;
  }

  ///generates hashcode of this object instance
  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        parentTypeId.hashCode;
  }
}
