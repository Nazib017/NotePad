
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel{
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String department;
  NoteModel(this.id,this.name,this.department);

}