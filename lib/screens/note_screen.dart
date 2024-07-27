import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notepad_getx/Models/note_model.dart';
import 'package:notepad_getx/controllers/note_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';
class NoteScreen extends StatelessWidget {
   NoteScreen({super.key});

  TextEditingController idclt=TextEditingController();
  TextEditingController nameclt=TextEditingController();
  TextEditingController deptclt=TextEditingController();
  NoteController noteController=Get.put(NoteController());
 final box=Hive.box("notes");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
        backgroundColor: Colors.brown[400],
        elevation: 2.0,

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showDialogue(context);
        },
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
      ),
      body: GetBuilder<NoteController>(builder: (context){
         return Padding(
           padding: const EdgeInsets.all(8.0),
           child: ValueListenableBuilder(
             valueListenable: box.listenable(),
             builder: (context,box,child) {
               return ListView.builder(

                   shrinkWrap: true,
                   itemCount: box.keys.length,
                   itemBuilder: (context,index){

                     NoteModel note = box.getAt(index);
                 return Card(
                   elevation: 3,
                   margin: EdgeInsets.all(5.0),
                   child: ListTile(
                     leading: Text(note.id),
                     title: Text(note.name),
                     subtitle:  Text(note.department),
                     trailing: Container(

                       width: 100,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           InkWell(
                             onTap: (){
                                _showUpdateDialogue(context, index);

                             },
                             child: Icon(Icons.edit),
                           ),
                           InkWell(
                             onTap: (){
                            noteController.deleteNote(index);

                             },
                             child: Icon(Icons.delete,color: Colors.deepOrange,),
                           ),

                         ],
                       ),
                     ),
                   ),
                 );
                     });
             }
           ),
         );
    }),
    );
  }


   _showUpdateDialogue(BuildContext context,int index){
     return showDialog(context: context, builder: (context){
       return Center(
         child: SingleChildScrollView(
           child: AlertDialog(
             content: Column(
               children: [
                 TextField(
                   controller: idclt,
                   decoration: InputDecoration(
                     hintText: "Student ID",
                   ),
                 ),
                 SizedBox(height: 10,),
                 TextField(
                   controller: nameclt,
                   decoration: InputDecoration(
                     hintText: "Student Name",
                   ),
                 ),
                 SizedBox(height: 10,),
                 TextField(
                   controller: deptclt,
                   decoration: InputDecoration(
                     hintText: "Student Department",
                   ),
                 ),

               ],
             ) ,
             actions: [
               ElevatedButton(onPressed: (){
                 Navigator.pop(context);
               },
                 child: Text('Cancel',style: TextStyle(color: Colors.white),),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.deepOrange,
                 ),
               ),
               ElevatedButton(onPressed: (){
                 noteController.updateNote(NoteModel(idclt.text, nameclt.text, deptclt.text),index);
                 Navigator.pop(context);
               },
                 child: Text('Update',style: TextStyle(color: Colors.white),),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.deepOrange,
                 ),
               ),
             ],
           ),
         ),
       );
     });
   }


  _showDialogue(BuildContext context){
    return showDialog(context: context, builder: (context){
      return Center(
        child: SingleChildScrollView(
          child: AlertDialog(
            content: Column(
              children: [
                TextField(
                  controller: idclt,
                  decoration: InputDecoration(
                    hintText: "Student ID",
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: nameclt,
                  decoration: InputDecoration(
                    hintText: "Student Name",
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: deptclt,
                  decoration: InputDecoration(
                    hintText: "Student Department",
                  ),
                ),

              ],
            ) ,
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              },
                  child: Text('Cancel',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
              ),
              ElevatedButton(onPressed: (){
                noteController.createNote(NoteModel(idclt.text, nameclt.text, deptclt.text));
                Navigator.pop(context);
              },
                  child: Text('Submit',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }




}
