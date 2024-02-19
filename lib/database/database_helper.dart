import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = 'bmiDatabase.db';
  static const _databaseVersion = 3;
  static const bmiTable = 'bmiTable';
  static const columnId = 'id';
  static const columnBmi = 'bmi';
  static const columnWeight = 'weight';
  static const columnHeight = 'height';
  static const columnDate = 'date';
  static const columnClassification = 'classification';
  static const columnColorClassification = 'colorClassification';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();

    return _database!;
  }

  Future<void> initializeDatabase() async {
    _database = await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $bmiTable (
        $columnId TEXT PRIMARY KEY,
        $columnBmi REAL NOT NULL,
        $columnHeight REAL NOT NULL,
        $columnWeight REAL NOT NULL,
        $columnDate INTEGER NOT NULL,
        $columnClassification TEXT NOT NULL,
        $columnColorClassification TEXT NOT NULL        
      )
    ''');
  }
}
