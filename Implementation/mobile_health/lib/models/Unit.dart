import 'dart:convert';
import '../database/database_provider.dart';
import 'DBO.dart';

///class representing a meassurement unit
class Unit implements DBO {
  /// database id
  int id;

  /// name of this unit
  String name;
  Unit({
    this.id,
    this.name,
  });

  ///returns a copy of this object with the supplied values or the instance values
  Unit copyWith({
    int id,
    String name,
  }) {
    return Unit(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  ///returns a map of this object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_NAME: name,
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }

    return map;
  }

  ///generates an instance of this class from a map
  factory Unit.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Unit(
      id: map[DatabaseProvider.COLUMN_ID],
      name: map[DatabaseProvider.COLUMN_NAME],
    );
  }

  ///returns JSON-format string of this instance
  String toJson() => json.encode(toMap());

  ///generates instance of this class from a JSON-format string
  factory Unit.fromJson(String source) => Unit.fromMap(json.decode(source));

  ///returns string representation of this object instance
  @override
  String toString() => 'Unit(id: $id, name: $name)';

  /// checks for equality between two instances of this class
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Unit && o.id == id && o.name == name;
  }

  ///generates hashcode of this object instance
  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
