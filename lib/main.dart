import 'package:flutter/material.dart';
import 'package:notepad_getx/Models/note_model.dart';
import 'package:notepad_getx/screens/note_screen.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notepad_getx/screens/note_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox("notes");
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: NoteScreen(),
    );
  }
}

