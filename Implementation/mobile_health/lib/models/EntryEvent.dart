import 'dart:convert';
import 'EntryType.dart';
import 'Unit.dart';

class EntryEvent {
  int id;
  double quantity;
  Unit unit;
  EntryType entryType;
  EntryEvent({
    this.id,
    this.quantity,
    this.unit,
    this.entryType,
  });

  EntryEvent copyWith({
    int id,
    double quantity,
    Unit unit,
    EntryType type,
  }) {
    return EntryEvent(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      entryType: type ?? this.entryType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quantity': quantity,
      'unit': unit?.toMap(),
      'type': entryType?.toMap(),
    };
  }

  factory EntryEvent.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EntryEvent(
      id: map['id'],
      quantity: map['quantity'],
      unit: Unit.fromMap(map['unit']),
      entryType: EntryType.fromMap(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EntryEvent.fromJson(String source) =>
      EntryEvent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EntryEvent(id: $id, quantity: $quantity, unit: $unit, type: $entryType)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EntryEvent &&
        o.id == id &&
        o.quantity == quantity &&
        o.unit == unit &&
        o.entryType == entryType;
  }

  @override
  int get hashCode {
    return id.hashCode ^ quantity.hashCode ^ unit.hashCode ^ entryType.hashCode;
  }
}
