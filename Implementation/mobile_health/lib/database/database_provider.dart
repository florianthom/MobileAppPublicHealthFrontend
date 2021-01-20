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

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'ThyroHelph1.db'),
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
              'INSERT INTO $TABLE_UNIT ($COLUMN_NAME) VALUES ("m"), ("g"), ("km"), ("kg"), ("min"), ("sec"), ("h")');
        });

        await database.transaction((txn) async {
          await txn.rawInsert(
              'INSERT INTO $TABLE_ENTRYTYPE ($COLUMN_NAME, $COLUMN_DESCRIPTION) VALUES ("Sport", "sportliche Aktivitäten"), ("Ernährung", "Obergruppe für Nahrungsmittel"), ("Stimmung", "Obergruppe für Stimmungsänderungen")');
        });

        await database.transaction((txn) async {
          await txn
              .rawInsert('INSERT INTO $TABLE_DIARY ($COLUMN_ID) VALUES (1)');
        });

        await database.transaction((txn) async {
          await txn.rawInsert(
              'INSERT INTO $TABLE_DIARY_ENTRY ($COLUMN_DATE, $COLUMN_COMMENT, $COLUMN_DIARYID) VALUES ("2021-01-20", "Dies ist ein Beispieleintrag", 1)');
        });

        await database.transaction((txn) async {
          await txn.rawInsert(
              'INSERT INTO $TABLE_ENTRY_EVENT ($COLUMN_QUANTITY, $COLUMN_UNIT, $COLUMN_DIARY_ENTRY_ID, $COLUMN_ENTRYTYPE) VALUES (50, 1, 1, 1)');
        });
      },
    );
  }

  ///example: insert("DiaryEntry", entryObject)
  ///example: insert(entryObject.runtimeType.toString(), entryObject)
  Future<DBO> insert(String className, DBO entry) async {
    final db = await database;

    entry.id = await db.insert(className, entry.toMap());

    return entry;
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

  Future<Diary> getDiaryById(int id) async {
    final db = await database;

    //get the diary from db
    var queryResult = await db.query(TABLE_DIARY,
        columns: [COLUMN_ID], where: "$COLUMN_ID = ?", whereArgs: [id]);

    if (queryResult.length > 0) {
      //sqflite query results are read only, so we need new maps to change them
      List<Map<String, dynamic>> diaryEntryMapList =
          new List<Map<String, dynamic>>();

      List<Map<String, dynamic>> entryEventMapList;
      //a lot of magic follows to allow clean execution of Diary.fromMap()
      //get all diaryEntries belonging to this diary as a map
      var diaryEntriesQuery = await db.query(TABLE_DIARY_ENTRY,
          columns: [COLUMN_ID, COLUMN_DATE, COLUMN_COMMENT, COLUMN_DIARYID],
          where: "$COLUMN_DIARYID = ?",
          whereArgs: [id]);

      if (diaryEntriesQuery.length > 0) {
        //get all entryEvents belonging to each diaryEntry as a map
        diaryEntriesQuery.forEach((diaryEntry) async {
          entryEventMapList = new List<Map<String, dynamic>>();
          var inMemoryMap = diaryEntry;
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

          //get all Units and EntryTypes for each entryEvent as a map
          entryEventQuery.forEach((entryEvent) async {
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

            var memoryEntryEvent = entryEvent;

            memoryEntryEvent[COLUMN_UNIT] = unitQuery.first;
            memoryEntryEvent[COLUMN_ENTRYTYPE] = entryTypeQuery.first;

            entryEventMapList.add(memoryEntryEvent);
          });

          inMemoryMap[COLUMN_ENTRY_EVENTS] = entryEventMapList;
          diaryEntryMapList.add(inMemoryMap);
        });
      }

      var map = queryResult.first;
      map[COLUMN_DIARY_ENTRIES] = diaryEntryMapList;
      return Diary.fromMap(map);
    }

    return null;
  }

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

      entryEventsQuery.forEach((element) async {
        var entry = await getEntryEventById(element[COLUMN_ID]);

        if (entry != null) {
          entryEventList.add(entry);
        }
      });

      var resultMap = queryResult.first;
      resultMap[COLUMN_ENTRY_EVENTS] = null;

      var result = DiaryEntry.fromMap(resultMap);
      result.entryEvents = entryEventList;

      return result;
    }

    return null;
  }

  Future<EntryEvent> getEntryEventById(int id) async {
    final db = await database;

    var queryResult = await db.query(TABLE_ENTRY_EVENT,
        columns: [COLUMN_ID, COLUMN_QUANTITY, COLUMN_UNIT, COLUMN_ENTRYTYPE],
        where: "$COLUMN_ID = ?",
        whereArgs: [id]);

    if (queryResult.length > 0) {
      var unitQuery = await getUnitById(queryResult.first[COLUMN_UNIT]);
      var entryTypeQuery =
          await getEntryTypeById(queryResult.first[COLUMN_ENTRYTYPE]);

      var resultMap = queryResult.first;
      resultMap[COLUMN_UNIT] = unitQuery.toMap();
      resultMap[COLUMN_ENTRYTYPE] = entryTypeQuery.toMap();
      var result = EntryEvent.fromMap(resultMap);
      return result;
    }

    return null;
  }

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

  Future<int> update(String tableName, DBO entry) async {
    final db = await database;

    return await db.update(tableName, entry.toMap(),
        where: "$COLUMN_ID = ?", whereArgs: [entry.id]);
  }

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

  Future<List<Diary>> getDiaries() async {
    final db = await database;

    var entries = await db.query(TABLE_DIARY, columns: [COLUMN_ID]);

    if (entries.length > 0) {
      List<Diary> diaryList = List<Diary>();

      entries.forEach((element) async {
        Diary diary = await getDiaryById(element[COLUMN_ID]);

        if (diary != null) {
          diaryList.add(diary);
        }
      });

      return diaryList;
    }

    return null;
  }

  Future<List<DiaryEntry>> getDiaryEntries() async {
    final db = await database;

    var entries = await db.query(TABLE_DIARY_ENTRY, columns: [COLUMN_ID]);
    if (entries.length > 0) {
      List<DiaryEntry> entryList = List<DiaryEntry>();

      entries.forEach((element) async {

        // error
        DiaryEntry entry = await getDiaryEntryById(element[COLUMN_ID]);

        print("here2");
        print(entry);
        if (entry != null) {
          entryList.add(entry);
        }
      });
      return entryList;
    }

    return null;
  }
}
