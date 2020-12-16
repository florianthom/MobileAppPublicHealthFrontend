///Database class interface
abstract class DBO {
  int id;

  Map<String, dynamic> toMap();

  DBO.fromMap(Map<String, dynamic> map);
}
