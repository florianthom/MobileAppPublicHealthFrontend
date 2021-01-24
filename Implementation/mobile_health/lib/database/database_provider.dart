import 'package:mobile_health/models/Diary.dart';
import 'package:mobile_health/models/DiaryEntry.dart';
import 'package:mobile_health/models/EntryEvent.dart';
import 'package:mobile_health/models/Unit.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import '../models/EntryType.dart';
import '../models/DBO.dart';

class DatabaseProvider {
  static const String COLUMN_ID = "id";
  static const String COLUMN_NAME = "name";

  static const String TABLE_DIARY = "Diary";
  static const String COLUMN_DIARY_ENTRIES = "diaryEntries";

  static const String TABLE_DIARY_ENTRY = "DiaryEntry";
  static const String COLUMN_DATE = "dateString";
  static const String COLUMN_COMMENT = "comment";
  static const String COLUMN_DIARYID = "diaryId";
  static const String COLUMN_ENTRY_EVENTS = "entryEvents";

  static const String TABLE_ENTRY_EVENT = "EntryEvent";
  static const String COLUMN_QUANTITY = "quantity";
  static const String COLUMN_UNIT = "unit";
  static const String COLUMN_DIARY_ENTRY_ID = "diaryEntryId";
  static const String COLUMN_ENTRYTYPE = "entryType";

  static const String TABLE_ENTRYTYPE = "EntryType";
  static const String COLUMN_DESCRIPTION = "description";
  static const String COLUMN_PARENTTYPEID = "parentTypeId";

  static const String TABLE_UNIT = "Unit";

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  ///*
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  ///*
  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'ThyroHelph2.db'),
      version: 1, //change this number on changes to DB model
      onCreate: (Database database, int version) async {
        print("creating Diary table");

        await database.execute(
            "CREATE TABLE  $TABLE_DIARY ($COLUMN_ID INTEGER PRIMARY KEY)");

        print("creating EntryType table");

        await database.execute(
          "CREATE TABLE $TABLE_ENTRYTYPE ("
          "$COLUMN_ID INTEGER PRIMARY KEY,"
          "$COLUMN_NAME TEXT,"
          "$COLUMN_DESCRIPTION TEXT,"
          "$COLUMN_PARENTTYPEID INTEGER,"
          "FOREIGN KEY($COLUMN_PARENTTYPEID) REFERENCES $TABLE_ENTRYTYPE($COLUMN_ID)"
          ")",
        );

        print("creating Unit table");

        await database.execute(
          "CREATE TABLE $TABLE_UNIT ("
          "$COLUMN_ID INTEGER PRIMARY KEY,"
          "$COLUMN_NAME TEXT"
          ")",
        );

        print("creating DiaryEntry table");

        await database.execute(
          "CREATE TABLE $TABLE_DIARY_ENTRY ("
          "$COLUMN_ID INTEGER PRIMARY KEY,"
          "$COLUMN_DATE TEXT,"
          "$COLUMN_COMMENT TEXT,"
          "$COLUMN_DIARYID INTEGER,"
          "FOREIGN KEY($COLUMN_DIARYID) REFERENCES $TABLE_DIARY($COLUMN_ID)"
          ")",
        );

        print("creating EntryEvent table");

        await database.execute(
          "CREATE TABLE $TABLE_ENTRY_EVENT ("
          "$COLUMN_ID INTEGER PRIMARY KEY,"
          "$COLUMN_QUANTITY REAL,"
          "$COLUMN_UNIT INTEGER,"
          "$COLUMN_DIARY_ENTRY_ID INTEGER,"
          "$COLUMN_ENTRYTYPE INTEGER,"
          "FOREIGN KEY ($COLUMN_DIARY_ENTRY_ID) REFERENCES $TABLE_DIARY_ENTRY($COLUMN_ID),"
          "FOREIGN KEY($COLUMN_UNIT) REFERENCES $TABLE_UNIT($COLUMN_ID),"
          "FOREIGN KEY($COLUMN_ENTRYTYPE) REFERENCES $TABLE_ENTRYTYPE($COLUMN_ID)"
          ")",
        );

        ///DB setup with example data

        await database.transaction((txn) async {
          await txn.rawInsert(
              'INSERT INTO $TABLE_UNIT ($COLUMN_NAME) VALUES ("m"), ("g"), ("km"), ("kg"), ("min"), ("sec"), ("h"), ("mood")');
        });

        await database.transaction((txn) async {
          await txn.rawInsert(
              'INSERT INTO $TABLE_ENTRYTYPE ($COLUMN_NAME, $COLUMN_DESCRIPTION) VALUES ("Sport", "sportliche Aktivitäten"), ("Ernährung", "Obergruppe für Nahrungsmittel"), ("Stimmung", "Obergruppe für Stimmungsänderungen"), ("Schlaf", "Quantität des Schlafs")');
        });

        await database.transaction((txn) async {
          await txn.rawInsert(
              'INSERT INTO $TABLE_ENTRYTYPE ($COLUMN_NAME, $COLUMN_DESCRIPTION, $COLUMN_PARENTTYPEID) VALUES ("Joggen", "Joggen mit kurzem Sprint", "1")');
        });

        await database.transaction((txn) async {
          await txn
              .rawInsert('INSERT INTO $TABLE_DIARY ($COLUMN_ID) VALUES (1)');
        });

        await database.transaction((txn) async {
          await txn.rawInsert(
              'INSERT INTO $TABLE_DIARY_ENTRY ($COLUMN_DATE, $COLUMN_COMMENT, $COLUMN_DIARYID) VALUES ("2021-01-20", "Dies ist ein Beispieleintrag für Sport", 1), ("2021-01-20", "Dies ist ein Beispieleintrag für Mood", 2)');
        });

        await database.transaction((txn) async {
          await txn.rawInsert(
              'INSERT INTO $TABLE_ENTRY_EVENT ($COLUMN_QUANTITY, $COLUMN_UNIT, $COLUMN_DIARY_ENTRY_ID, $COLUMN_ENTRYTYPE) VALUES (50, 1, 1, 1), (40, 1, 1, 1), (70, 1, 2, 1), (7, 8, 2, 3)');
        });
      },
    );
  }

  ///function for inserting a DiaryEntry
  Future<DiaryEntry> insertDiaryEntry(DiaryEntry diaryEntry) async {
    final db = await database;

    diaryEntry.id = await db.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO $TABLE_DIARY_ENTRY ($COLUMN_DATE, $COLUMN_COMMENT, $COLUMN_DIARYID) VALUES (?, ?, ?)',
          [diaryEntry.dateString, diaryEntry.comment, diaryEntry.diaryId]);
    });

    return diaryEntry;
  }

  ///function for inserting a Diary
  Future<Diary> insertDiary(Diary diary) async {
    final db = await database;

    diary.id = await db.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO $TABLE_DIARY ($COLUMN_ID) VALUES (?)', [null]);
    });

    return diary;
  }

  ///function for inserting an EntryEvent
  Future<EntryEvent> insertEntryEvent(EntryEvent entryEvent) async {
    final db = await database;

    entryEvent.id = await db.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO $TABLE_ENTRY_EVENT ($COLUMN_QUANTITY, $COLUMN_UNIT, $COLUMN_DIARY_ENTRY_ID, $COLUMN_ENTRYTYPE) VALUES (?, ?, ?, ?)',
          [
            entryEvent.quantity,
            entryEvent.unit.id,
            entryEvent.diaryEntryId,
            entryEvent.entryType.id
          ]);
    });

    return entryEvent;
  }

  ///function for inserting an EntryType
  Future<EntryType> insertEntryType(EntryType entryType) async {
    final db = await database;

    entryType.id = await db.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO $TABLE_ENTRYTYPE ($COLUMN_NAME, $COLUMN_DESCRIPTION, $COLUMN_PARENTTYPEID) VALUES (?, ?, ?)',
          [entryType.name, entryType.description, entryType.parentTypeId]);
    });

    return entryType;
  }

  ///function for inserting a Unit
  Future<Unit> insertUnit(Unit unit) async {
    final db = await database;

    unit.id = await db.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO $TABLE_UNIT ($COLUMN_NAME) VALUES (?)', [unit.name]);
    });

    return unit;
  }

  ///example: delete("Unit", unit.id)
  Future<int> delete(String className, int id) async {
    final db = await database;

    return await db.delete(className, where: "$COLUMN_ID = ?", whereArgs: [id]);
  }

  Future<EntryType> getEntryTypeById(int id) async {
    final db = await database;

    var queryResult = await db.query(TABLE_ENTRYTYPE,
        columns: [
          COLUMN_ID,
          COLUMN_NAME,
          COLUMN_DESCRIPTION,
          COLUMN_PARENTTYPEID
        ],
        where: "$COLUMN_ID = ?",
        whereArgs: [id]);

    if (queryResult.length > 0) {
      return EntryType.fromMap(queryResult.first);
    }

    return null;
  }

  ///*
  Future<Diary> getDiaryById(int id) async {
    final db = await database;

    //get the diary from db
    var queryResult = await db.query(TABLE_DIARY,
        columns: [COLUMN_ID], where: "$COLUMN_ID = ?", whereArgs: [id]);

    if (queryResult.length > 0) {
      //sqflite query results are read only, so we need new maps to change them
      //a lot of magic follows to allow clean execution of Diary.fromMap()
      //get all diaryEntries belonging to this diary as a map
      var diaryEntriesQuery = await db.query(TABLE_DIARY_ENTRY,
          columns: [COLUMN_ID, COLUMN_DATE, COLUMN_COMMENT, COLUMN_DIARYID],
          where: "$COLUMN_DIARYID = ?",
          whereArgs: [id]);

      var dEntriesReadable = _makeModifiableResults(diaryEntriesQuery);

      if (diaryEntriesQuery.length > 0) {
        //get all entryEvents belonging to each diaryEntry as a map
        await Future.forEach(dEntriesReadable, (diaryEntry) async {
          var entryEventQuery = await db.query(TABLE_ENTRY_EVENT,
              columns: [
                COLUMN_ID,
                COLUMN_QUANTITY,
                COLUMN_UNIT,
                COLUMN_DIARY_ENTRY_ID,
                COLUMN_ENTRYTYPE
              ],
              where: "$COLUMN_DIARY_ENTRY_ID = ?",
              whereArgs: [diaryEntry[COLUMN_ID]]);

          var entriesReadable = _makeModifiableResults(entryEventQuery);

          //get all Units and EntryTypes for each entryEvent as a map
          await Future.forEach(entriesReadable, (entryEvent) async {
            var unitQuery = await db.query(TABLE_UNIT,
                columns: [COLUMN_ID, COLUMN_NAME],
                where: "$COLUMN_ID = ?",
                whereArgs: [entryEvent[COLUMN_UNIT]]);
            var entryTypeQuery = await db.query(TABLE_ENTRYTYPE,
                columns: [
                  COLUMN_ID,
                  COLUMN_NAME,
                  COLUMN_DESCRIPTION,
                  COLUMN_PARENTTYPEID
                ],
                where: "$COLUMN_ID = ?",
                whereArgs: [entryEvent[COLUMN_ENTRYTYPE]]);

            entryEvent[COLUMN_UNIT] = unitQuery.first;
            entryEvent[COLUMN_ENTRYTYPE] = entryTypeQuery.first;
          });

          diaryEntry[COLUMN_ENTRY_EVENTS] = entriesReadable;
        });
      }

      var resultMap = Map<String, dynamic>.from(queryResult.first);
      resultMap[COLUMN_DIARY_ENTRIES] = dEntriesReadable;
      return Diary.fromMap(resultMap);
    }

    return null;
  }

  ///*
  Future<DiaryEntry> getDiaryEntryById(int id) async {
    final db = await database;

    var queryResult = await db.query(TABLE_DIARY_ENTRY,
        columns: [COLUMN_ID, COLUMN_DATE, COLUMN_COMMENT, COLUMN_DIARYID],
        where: "$COLUMN_ID = ?",
        whereArgs: [id]);

    if (queryResult.length > 0) {
      var entryEventsQuery = await db.query(TABLE_ENTRY_EVENT,
          columns: [COLUMN_ID],
          where: "$COLUMN_DIARY_ENTRY_ID = ?",
          whereArgs: [id]);

      var entryEventList = new List<EntryEvent>();
      var entryEventsQueryRead = _makeModifiableResults(entryEventsQuery);

      await Future.forEach(entryEventsQueryRead, (element) async {
        var entry = await getEntryEventById(element[COLUMN_ID]);

        if (entry != null) {
          entryEventList.add(entry);
        }
      });

      Map<String, dynamic> resultMap =
          Map<String, dynamic>.from(queryResult.first);
      resultMap[COLUMN_ENTRY_EVENTS] =
          entryEventList.map((element) => element.toMap()).toList();

      var result = DiaryEntry.fromMap(resultMap);

      return result;
    }

    return null;
  }

  ///*
  Future<EntryEvent> getEntryEventById(int id) async {
    final db = await database;

    var queryResult = await db.query(TABLE_ENTRY_EVENT,
        columns: [
          COLUMN_ID,
          COLUMN_QUANTITY,
          COLUMN_UNIT,
          COLUMN_ENTRYTYPE,
          COLUMN_DIARY_ENTRY_ID
        ],
        where: "$COLUMN_ID = ?",
        whereArgs: [id]);

    if (queryResult.length > 0) {
      var unitQuery = await getUnitById(queryResult.first[COLUMN_UNIT]);
      var entryTypeQuery =
          await getEntryTypeById(queryResult.first[COLUMN_ENTRYTYPE]);

      Map<String, dynamic> resultMap =
          Map<String, dynamic>.from(queryResult.first);
      resultMap[COLUMN_UNIT] = unitQuery.toMap();
      resultMap[COLUMN_ENTRYTYPE] = entryTypeQuery.toMap();
      var result = EntryEvent.fromMap(resultMap);
      return result;
    }

    return null;
  }

  ///*
  Future<Unit> getUnitById(int id) async {
    final db = await database;

    var queryResult = await db.query(TABLE_UNIT,
        columns: [COLUMN_ID, COLUMN_NAME],
        where: "$COLUMN_ID = ?",
        whereArgs: [id]);

    if (queryResult.length > 0) {
      return Unit.fromMap(queryResult.first);
    }

    return null;
  }

  ///*
  Future<int> update(String tableName, DBO entry) async {
    final db = await database;

    return await db.update(tableName, entry.toMap(),
        where: "$COLUMN_ID = ?", whereArgs: [entry.id]);
  }

  Future<List<EntryEvent>> getEntryEvents() async {
    final db = await database;

    var entries = await db.query(TABLE_ENTRY_EVENT, columns: [COLUMN_ID]);

    if (entries.length > 0) {
      List<EntryEvent> eventList = List<EntryEvent>();

      await Future.forEach(entries, (element) async {
        EntryEvent entry = await getEntryEventById(element[COLUMN_ID]);

        eventList.add(entry);
      });

      return eventList;
    }

    return null;
  }

  ///*
  Future<List<EntryType>> getEntryTypes() async {
    final db = await database;

    var entries = await db.query(TABLE_ENTRYTYPE, columns: [
      COLUMN_ID,
      COLUMN_NAME,
      COLUMN_DESCRIPTION,
      COLUMN_PARENTTYPEID
    ]);

    List<EntryType> typeList = List<EntryType>();

    entries.forEach((element) {
      EntryType entryType = EntryType.fromMap(element);

      typeList.add(entryType);
    });

    return typeList;
  }

  ///*
  Future<List<Unit>> getUnits() async {
    final db = await database;

    var entries = await db.query(TABLE_UNIT, columns: [COLUMN_ID, COLUMN_NAME]);

    List<Unit> unitList = List<Unit>();

    entries.forEach((element) {
      Unit unit = Unit.fromMap(element);

      unitList.add(unit);
    });

    return unitList;
  }

  ///*
  Future<List<Diary>> getDiaries() async {
    final db = await database;

    var entries = await db.query(TABLE_DIARY, columns: [COLUMN_ID]);

    if (entries.length > 0) {
      List<Diary> diaryList = List<Diary>();

      var editableResults = _makeModifiableResults(entries);
      await Future.forEach(editableResults, (element) async {
        Diary diary = await getDiaryById(element[COLUMN_ID]);

        if (diary != null) {
          diaryList.add(diary);
        }
      });

      return diaryList;
    }

    return null;
  }

  ///*
  Future<List<DiaryEntry>> getDiaryEntries() async {
    final db = await database;

    var entries = await db.query(TABLE_DIARY_ENTRY, columns: [COLUMN_ID]);
    if (entries.length > 0) {
      List<DiaryEntry> entryList = List<DiaryEntry>();

      var editableResult = _makeModifiableResults(entries);
      await Future.forEach(editableResult, (element) async {
        DiaryEntry entry = await getDiaryEntryById(element[COLUMN_ID]);

        if (entry != null) {
          entryList.add(entry);
        }
      });
      return entryList;
    }
    return null;
  }

  /// Generate a modifiable result set
  List<Map<String, dynamic>> _makeModifiableResults(
      List<Map<String, dynamic>> results) {
    // Generate modifiable
    return List<Map<String, dynamic>>.generate(
        results.length, (index) => Map<String, dynamic>.from(results[index]),
        growable: true);
  }
}
