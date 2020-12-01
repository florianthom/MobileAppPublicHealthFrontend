import 'dart:convert';

class EntryType {
  int id;
  String name;
  String description;
  int parentTypeId;
  EntryType({
    this.id,
    this.name,
    this.description,
    this.parentTypeId,
  });

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'parentTypeId': parentTypeId,
    };
  }

  factory EntryType.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EntryType(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      parentTypeId: map['parentTypeId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EntryType.fromJson(String source) =>
      EntryType.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Type(id: $id, name: $name, description: $description, parentTypeId: $parentTypeId)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EntryType &&
        o.id == id &&
        o.name == name &&
        o.description == description &&
        o.parentTypeId == parentTypeId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        parentTypeId.hashCode;
  }
}
