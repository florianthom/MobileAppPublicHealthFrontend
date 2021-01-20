import 'dart:convert';
import '../database/database_provider.dart';
import 'DBO.dart';

///*
class Unit implements DBO {
  int id;
  String name;
  Unit({
    this.id,
    this.name,
  });

  ///*
  Unit copyWith({
    int id,
    String name,
  }) {
    return Unit(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  ///*
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_NAME: name,
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }

    return map;
  }

  ///*
  factory Unit.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Unit(
      id: map[DatabaseProvider.COLUMN_ID],
      name: map[DatabaseProvider.COLUMN_NAME],
    );
  }

  String toJson() => json.encode(toMap());

  factory Unit.fromJson(String source) => Unit.fromMap(json.decode(source));

  @override
  String toString() => 'Unit(id: $id, name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Unit && o.id == id && o.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
