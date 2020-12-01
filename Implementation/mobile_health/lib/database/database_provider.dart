import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {
  static const String COLUMN_ID = "id";
  static const String COLUMN_NAME = "name";

  static const String TABLE_DIARY = "Diary";
  static const String COLUMN_DIARY_ENTRIES = "diaryEntries";

  static const String TABLE_DIARY_ENTRY = "DiaryEntry";
  static const String COLUMN_DATE = "dateString";
  static const String COLUMN_COMMENT = "comment";
  static const String COLUMN_ENTRY_EVENTS = "entryEvents";

  static const String TABLE_ENTRY_EVENT = "EntryEvent";
  static const String COLUMN_QUANTITY = "quantity";
  static const String COLUMN_UNIT = "unit";
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
      join(dbPath, 'ThyroHelphii.db'),
      version: 1, //change this number on changes to DB model
      onCreate: (Database database, int version) async {
        print("creating Diary table");

        await database.execute(
            "CREATE TABLE  $TABLE_DIARY ($COLUMN_ID INTEGER PRIMARY KEY)");

        print("creating DiaryEntry table");

        await database.execute(
          "CREATE TABLE $TABLE_DIARY_ENTRY ("
          "$COLUMN_ID INTEGER PRIMARY KEY,"
          "$COLUMN_DATE TEXT,"
          "$COLUMN_COMMENT TEXT"
          ")",
        );

        print("creating EntryEvent table");

        await database.execute(
          "CREATE TABLE $TABLE_ENTRY_EVENT ("
          "$COLUMN_ID INTEGER PRIMARY KEY,"
          "$COLUMN_QUANTITY REAL,"
          "$COLUMN_UNIT INTEGER"
          "$COLUMN_ENTRYTYPE INTEGER,"
          "FOREIGN KEY($COLUMN_UNIT) REFERENCES $TABLE_UNIT($COLUMN_ID),"
          "FOREIGN KEY($COLUMN_ENTRYTYPE) REFERENCES $TABLE_ENTRYTYPE($COLUMN_ID)"
          ")",
        );

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

        print("creating Diary_DiaryEntry table");

        await database.execute(
          "CREATE TABLE Diary_DiaryEntry ("
          "Diary_id INTEGER,"
          "DiaryEntry_id INTEGER,"
          "FOREIGN KEY(Diary_id) REFERENCES $TABLE_DIARY($COLUMN_ID),"
          "FOREIGN KEY(DiaryEntry_id) REFERENCES $TABLE_DIARY_ENTRY($COLUMN_ID)"
          ")",
        );

        print("creating DiaryEntry_EntryEvent table");

        await database.execute(
          "CREATE TABLE DiaryEntry_EntryEvent ("
          "DiaryEntry_id,"
          "EntryEvent_id,"
          "FOREIGN KEY(DiaryEntry_id) REFERENCES $TABLE_DIARY_ENTRY($COLUMN_ID),"
          "FOREIGN KEY(EntryEvent_id) REFERENCES $TABLE_ENTRY_EVENT($COLUMN_ID)"
          ")",
        );
      },
    );
  }
}
