import 'dart:convert';
import 'package:collection/collection.dart';
import '../database/database_provider.dart';
import 'DiaryEntry.dart';
import 'DBO.dart';

///class representing a Diary
class Diary implements DBO {
  ///database id
  int id;

  ///List of DiaryEntries with a foreign key connection to this object
  List<DiaryEntry> diaryEntries;

  Diary({
    this.id,
    this.diaryEntries,
  });

  ///returns a copy of this object with the supplied values or the instance values
  Diary copyWith({
    int id,
    List<DiaryEntry> diaryEntries,
  }) {
    return Diary(
      id: id ?? this.id,
      diaryEntries: diaryEntries ?? this.diaryEntries,
    );
  }

  ///returns a map of this object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_DIARY_ENTRIES:
          diaryEntries?.map((x) => x?.toMap())?.toList(),
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }

    return map;
  }

  ///generates an instance of this class from a map
  factory Diary.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Diary(
      id: map[DatabaseProvider.COLUMN_ID],
      diaryEntries: List<DiaryEntry>.from(
          map[DatabaseProvider.COLUMN_DIARY_ENTRIES]
              ?.map((x) => DiaryEntry.fromMap(x))),
    );
  }

  ///returns JSON-format string of this instance
  String toJson() => json.encode(toMap());

  ///generates instance of this class from a JSON-format string
  factory Diary.fromJson(String source) => Diary.fromMap(json.decode(source));

  ///returns string representation of this object instance
  @override
  String toString() => 'Diary(id: $id, diaryEntries: $diaryEntries)';

  /// checks for equality between two instances of this class
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Diary && o.id == id && listEquals(o.diaryEntries, diaryEntries);
  }

  ///generates hashcode of this object instance
  @override
  int get hashCode => id.hashCode ^ diaryEntries.hashCode;
}
