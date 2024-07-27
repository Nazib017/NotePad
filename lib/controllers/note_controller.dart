import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:notepad_getx/Models/note_model.dart';

class NoteController extends GetxController{

final box=Hive.box("notes");
void createNote(NoteModel note){
  box.add(note);
  update();
}
void updateNote(NoteModel note,int index){
  box.putAt(index, note);
  update();
}

void deleteNote(int index){
  box.deleteAt(index);
  update();
}

}