import 'dart:convert';
import 'package:collection/collection.dart';
import '../database/database_provider.dart';
import 'EntryEvent.dart';
import 'DBO.dart';

///class representing an entry into a diary
class DiaryEntry implements DBO {
  /// primary key id
  int id;

  /// ISO8601 representation of the date when this DiaryEntry was made
  String dateString;

  /// description made by the user
  String comment;

  /// id of the connected Diary
  int diaryId;

  /// list of EntryEvent connected to this instance
  List<EntryEvent> entryEvents;
  DiaryEntry({
    this.id,
    this.dateString,
    this.comment,
    this.diaryId,
    this.entryEvents,
  });

  /// returns a copy of this object with the supplied values or the instance values
  DiaryEntry copyWith({
    int id,
    String dateString,
    String comment,
    int diaryId,
    List<EntryEvent> entryEvents,
  }) {
    return DiaryEntry(
      id: id ?? this.id,
      dateString: dateString ?? this.dateString,
      comment: comment ?? this.comment,
      diaryId: diaryId ?? this.diaryId,
      entryEvents: entryEvents ?? this.entryEvents,
    );
  }

  ///returns a map of this object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_DATE: dateString,
      DatabaseProvider.COLUMN_COMMENT: comment,
      DatabaseProvider.COLUMN_DIARYID: diaryId,
      DatabaseProvider.COLUMN_ENTRY_EVENTS:
          entryEvents?.map((x) => x?.toMap())?.toList(),
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }

    return map;
  }

  ///generates an instance of this class from a map
  factory DiaryEntry.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DiaryEntry(
      id: map[DatabaseProvider.COLUMN_ID],
      dateString: map[DatabaseProvider.COLUMN_DATE],
      comment: map[DatabaseProvider.COLUMN_COMMENT],
      diaryId: map[DatabaseProvider.COLUMN_DIARYID],
      entryEvents: List<EntryEvent>.from(
          map[DatabaseProvider.COLUMN_ENTRY_EVENTS]
              ?.map((x) => EntryEvent.fromMap(x))),
    );
  }

  ///returns JSON-format string of this instance
  String toJson() => json.encode(toMap());

  ///generates instance of this class from a JSON-format string
  factory DiaryEntry.fromJson(String source) =>
      DiaryEntry.fromMap(json.decode(source));

  ///returns the dateString of the current object as a DateTime
  DateTime toDataTimeConvert() {
    DateTime date = DateTime.parse(this.dateString);

    return date;
  }

  ///returns string representation of this object instance
  @override
  String toString() {
    return 'DiaryEntry(id: $id, dateString: $dateString, comment: $comment, diaryId: $diaryId, entryEvents: $entryEvents)';
  }

  /// checks for equality between two instances of this class
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is DiaryEntry &&
        o.id == id &&
        o.dateString == dateString &&
        o.comment == comment &&
        o.diaryId == diaryId &&
        listEquals(o.entryEvents, entryEvents);
  }

  ///generates hashcode of this object instance
  @override
  int get hashCode {
    return id.hashCode ^
        dateString.hashCode ^
        comment.hashCode ^
        diaryId.hashCode ^
        entryEvents.hashCode;
  }
}
