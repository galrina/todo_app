import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String userToDo ='';
  List todoList = [];

  void initState() {
    // TODO: implement initState
    super.initState();

    todoList.addAll(['Buy milk', 'Wash dishes','Walk the bear']);
  }

  void _menuOpen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text('Menu'),),
          body: Row(
            children: [
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              }, child: Text('Back')),
              Padding(padding: EdgeInsets.only(left:15)),
              Text('Menu text')
            ],
          )
        );
      })
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('To-Do List'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.menu),
            onPressed: _menuOpen,)
        ],
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext, int index) {
            return Dismissible(
              key: Key(todoList[index]),
              child: Card(
                child: ListTile(
                    title: Text(todoList[index]),
                trailing: IconButton(
                    icon: Icon(
                    Icons.delete_outlined,
                  color: Colors.grey[900],
                ),
                  onPressed: () {
                    setState(() {
                      todoList.removeAt(index);
                    });
                  },
                ),),
              ),
              onDismissed: (direction) {
               // if(direction == DismissDirection.end)
                setState(() {
                  todoList.removeAt(index);
                });
              }
            );
          }
      ),
        floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Add'),
              content: TextField(
                onChanged: (String value) {
                  userToDo = value;
                }
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    todoList.add(userToDo);
                  });
                  Navigator.of(context).pop();
                }, child: Text('Add'))
              ],
            );
          });
        }
    ),
    );
  }
}


  

  

