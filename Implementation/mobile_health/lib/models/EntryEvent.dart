import 'dart:convert';
import '../database/database_provider.dart';
import 'EntryType.dart';
import 'Unit.dart';
import 'DBO.dart';

///*
class EntryEvent implements DBO {
  int id;
  double quantity;
  Unit unit;
  int diaryEntryId;
  EntryType entryType;
  EntryEvent({
    this.id,
    this.quantity,
    this.unit,
    this.diaryEntryId,
    this.entryType,
  });

  ///*
  EntryEvent copyWith({
    int id,
    double quantity,
    Unit unit,
    int diaryEntryId,
    EntryType type,
  }) {
    return EntryEvent(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      diaryEntryId: diaryEntryId ?? this.diaryEntryId,
      entryType: type ?? this.entryType,
    );
  }

  ///*
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_QUANTITY: quantity,
      DatabaseProvider.COLUMN_UNIT: unit?.toMap(),
      DatabaseProvider.COLUMN_DIARY_ENTRY_ID: diaryEntryId,
      DatabaseProvider.COLUMN_ENTRYTYPE: entryType?.toMap(),
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }

    return map;
  }

  ///*
  factory EntryEvent.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EntryEvent(
      id: map[DatabaseProvider.COLUMN_ID],
      quantity: map[DatabaseProvider.COLUMN_QUANTITY],
      unit: Unit.fromMap(map[DatabaseProvider.COLUMN_UNIT]),
      diaryEntryId: map[DatabaseProvider.COLUMN_DIARY_ENTRY_ID],
      entryType: EntryType.fromMap(map[DatabaseProvider.COLUMN_ENTRYTYPE]),
    );
  }

  String toJson() => json.encode(toMap());

  factory EntryEvent.fromJson(String source) =>
      EntryEvent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EntryEvent(id: $id, quantity: $quantity, unit: $unit, diaryEntryId: $diaryEntryId, type: $entryType)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EntryEvent &&
        o.id == id &&
        o.quantity == quantity &&
        o.unit == unit &&
        o.diaryEntryId == diaryEntryId &&
        o.entryType == entryType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        quantity.hashCode ^
        unit.hashCode ^
        diaryEntryId.hashCode ^
        entryType.hashCode;
  }
}
