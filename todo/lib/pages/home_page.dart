import 'package:flutter/material.dart';
import 'package:todo/widgets/dialog_box.dart';
import 'package:todo/widgets/todo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  List todos = [
    ["todo text",false],
    ["todo text1",true],
    ["todo text",false],
  ];

  void checkBoxChanged(bool? value , int index){
    setState(() {
      todos[index][1] = !todos[index][1];
    });
  }
  void saveNewTask(){
    setState(() {
      todos.add([
        _controller.text,
        false
      ]);
      _controller.clear();
    });
      Navigator.of(context).pop();

  }
  void createNewTodo(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onCancel: ()=>Navigator.of(context).pop(),
        onSave: saveNewTask,
        );
    });
  }   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.yellow[200],
    appBar: AppBar(
      title: Text("Todo"),
      elevation: 0, //drop shadow
    ),
    floatingActionButton: FloatingActionButton(
      onPressed:createNewTodo,
      child: Icon(Icons.add),
    ),
    body: ListView.builder(
      itemCount: todos.length,
     
      itemBuilder: (context, index) {
            return  TodoTile(
          taskName: todos[index][0],
         completed: todos[index][1], 
        onChanged: (value)=>checkBoxChanged(value,index),
        );
      },
    ),
    );
  }
}
