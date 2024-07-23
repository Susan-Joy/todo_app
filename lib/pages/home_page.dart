// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to/data/database.dart';
import 'package:to/util/dialog_box.dart';
import '../util/todo_tile.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState(){
    return _HomePageState();
  } 
  }
class _HomePageState extends State<HomePage> {
final _myBox = Hive.box('mybox');
ToDoDataBase db = ToDoDataBase();

@override
  void initState() {
      if(_myBox.get("TODDOLIST") == null){
        db.createInitialData();
      } else {
        db.loadData();     
       }

    super.initState();
  }

final _controller = TextEditingController();

  

  void checkBoxChanged(bool? value,int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([ _controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
     db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
       builder: (context){
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
          );
       },
      );
  }

  void deleteTask(int index){
      setState(() {
        db.toDoList.removeAt(index);
      });
       db.updateDataBase();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('DO WHAT U WANT '),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed:createNewTask,
        child: Icon(Icons.add),
        ),

      body: ListView.builder(
       itemCount: db.toDoList.length,
       itemBuilder: (value,index) {
        return TodoTile(
          taskName: db.toDoList[index][0],
           taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value,index),
            deleteFunction: (context) => deleteTask(index),
            );
       }
    ),
    );
  }

  
}