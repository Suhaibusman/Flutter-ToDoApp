import 'package:flutter/material.dart';
import 'package:todoapp/drawerList.dart';
import 'package:todoapp/header.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<String> all_Task = ["app Complete krni he", "projects dekhne he", "dart ki pratice krni he"];

  TextEditingController addTaskValue = TextEditingController();
  TextEditingController updateTaskValue = TextEditingController();
  addTask() {
    setState(() {
      if(addTaskValue.text.isEmpty){
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
    content: Text("Please Enter Task"),
  ),
          );
        });
      } else if (all_Task.contains(addTaskValue.text)) {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
    content: Text("Task Already Exsist"),
  ),
          );
        });
        addTaskValue.clear();
      }
     else if (addTaskValue.text.isNotEmpty) {
        all_Task.add(addTaskValue.text);
        addTaskValue.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: TextField(
          style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: "Enter Task",
                  hintStyle: TextStyle(color: Colors.white),
                   
                  ),
                  controller: addTaskValue,
                  
                ),
          actions: [Container(
            color: Colors.transparent,
            height: 20,
            child: IconButton(
                  onPressed: addTask,
                
                  icon: const Icon(Icons.add),
                  
                ),
          ),],
        backgroundColor: Colors.green[900],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          
          child: Column(
            children: const [
              MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
      body: ListView.builder(
                      itemCount: all_Task.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(bottom: 2),
              padding: const EdgeInsets.all(2),
              child: ListTile(
                title: Text(all_Task[index]),
                tileColor: Colors.green[200],
                trailing: Wrap(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        updateTaskValue.text=all_Task[index];
                         setState(() {
                          showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              title: const Text("Edit Task"),
                            content:  TextField(
                              decoration: const InputDecoration(

                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      
                    ),),
                                controller: updateTaskValue,
                            ),
                            actions: [
                              ElevatedButton(onPressed: (){
                                if (updateTaskValue.text =="") {
                                  
                                    ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                   content: Text("Empty Task Can't be Updated"),
                  ),
          );
                                } else {
                                    setState(() {
                                    all_Task[index]=updateTaskValue.text;
                                  });
                                  updateTaskValue.clear();
                                  Navigator.pop(context);
                                }
                                
                
                              }, child: const Text("Done"))
                            ],
                            );
                          },);
                        });
                       
                        // Implement edit functionality
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          all_Task.removeAt(index);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
