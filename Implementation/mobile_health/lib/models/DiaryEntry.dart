import 'dart:convert';

import 'package:collection/collection.dart';

import 'EntryEvent.dart';

class DiaryEntry {
  int id;
  String dateString;
  String comment;
  List<EntryEvent> entryEvents;
  DiaryEntry({
    this.id,
    this.dateString,
    this.comment,
    this.entryEvents,
  });

  DiaryEntry copyWith({
    int id,
    String dateString,
    String comment,
    List<EntryEvent> entryEvents,
  }) {
    return DiaryEntry(
      id: id ?? this.id,
      dateString: dateString ?? this.dateString,
      comment: comment ?? this.comment,
      entryEvents: entryEvents ?? this.entryEvents,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dateString': dateString,
      'comment': comment,
      'entryEvents': entryEvents?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory DiaryEntry.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DiaryEntry(
      id: map['id'],
      dateString: map['dateString'],
      comment: map['comment'],
      entryEvents: List<EntryEvent>.from(
          map['entryEvents']?.map((x) => EntryEvent.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DiaryEntry.fromJson(String source) =>
      DiaryEntry.fromMap(json.decode(source));

  ///returns the dateString of the current object as a DateTime
  DateTime toDataTimeConvert() {
    DateTime date = DateTime.parse(this.dateString);

    return date;
  }

  @override
  String toString() {
    return 'DiaryEntry(id: $id, dateString: $dateString, comment: $comment, entryEvents: $entryEvents)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is DiaryEntry &&
        o.id == id &&
        o.dateString == dateString &&
        o.comment == comment &&
        listEquals(o.entryEvents, entryEvents);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        dateString.hashCode ^
        comment.hashCode ^
        entryEvents.hashCode;
  }
}
