import 'dart:convert';
import '../database/database_provider.dart';
import 'EntryType.dart';
import 'Unit.dart';
import 'DBO.dart';

///class serving as the representation of an event that will be added to a diary entry
class EntryEvent implements DBO {
  /// database id
  int id;

  /// value representing the user supplied meassurement of an activity
  double quantity;

  /// represents the meassurement type
  Unit unit;

  /// id of the DiaryEntry row this EntryEvent belongs to
  int diaryEntryId;

  /// EntryType representing the category of this event
  EntryType entryType;
  EntryEvent({
    this.id,
    this.quantity,
    this.unit,
    this.diaryEntryId,
    this.entryType,
  });

  ///returns a copy of this object with the supplied values
  ///or if not supplied with the instance values
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

  ///returns a map of this object
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

  ///generates an instance of this class from a map
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

  ///returns JSON-format string of this instance
  String toJson() => json.encode(toMap());

  ///generates instance of this class from a JSON-format string
  factory EntryEvent.fromJson(String source) =>
      EntryEvent.fromMap(json.decode(source));

  ///returns string representation of this object instance
  @override
  String toString() {
    return 'EntryEvent(id: $id, quantity: $quantity, unit: $unit, diaryEntryId: $diaryEntryId, type: $entryType)';
  }

  /// checks for equality between two instances of this class
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

  ///generates hashcode of this object instance
  @override
  int get hashCode {
    return id.hashCode ^
        quantity.hashCode ^
        unit.hashCode ^
        diaryEntryId.hashCode ^
        entryType.hashCode;
  }
}
