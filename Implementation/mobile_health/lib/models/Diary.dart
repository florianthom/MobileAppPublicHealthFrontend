import 'dart:convert';

import 'package:collection/collection.dart';

import 'DiaryEntry.dart';

class Diary {
  int id;
  List<DiaryEntry> diaryEntries;
  Diary({
    this.id,
    this.diaryEntries,
  });

  Diary copyWith({
    int id,
    List<DiaryEntry> diaryEntries,
  }) {
    return Diary(
      id: id ?? this.id,
      diaryEntries: diaryEntries ?? this.diaryEntries,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'diaryEntries': diaryEntries?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Diary.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Diary(
      id: map['id'],
      diaryEntries: List<DiaryEntry>.from(
          map['diaryEntries']?.map((x) => DiaryEntry.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Diary.fromJson(String source) => Diary.fromMap(json.decode(source));

  @override
  String toString() => 'Diary(id: $id, diaryEntries: $diaryEntries)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Diary && o.id == id && listEquals(o.diaryEntries, diaryEntries);
  }

  @override
  int get hashCode => id.hashCode ^ diaryEntries.hashCode;
}
