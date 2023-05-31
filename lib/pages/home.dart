import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String userToDo = '';
  List todoList = [];

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }



  void _menuOpen() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(title: Text('Menu'),),
              body: Row(
                children: [
                  ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  }, child: Text('LogOut')),
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
         if (!snapshot.hasData) return Text('No Data');
         return ListView.builder(
             itemCount: snapshot.data?.docs.length,
             itemBuilder: (BuildContext context, int index) {
               return Dismissible(
                   key: Key(snapshot.data!.docs[index].id),
                   child: Card(
                     child: ListTile(
                       title: Text(snapshot.data?.docs[index].get('item')),
                       trailing: IconButton(
                         icon: Icon(
                           Icons.delete_outlined,
                           color: Colors.grey[900],
                         ),
                         onPressed: () {
                           FirebaseFirestore.instance.collection('items').doc(snapshot.data?.docs[index].id).delete();
                           },
                       ),
                     ),
                   ),
                   onDismissed: (direction) {

                   }
               );
             }
         );
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
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
                    FirebaseFirestore.instance.collection('items').add(
                        {'item': userToDo});
                    Navigator.of(context).pop();
                  },
                      child: Text('Add'))
                ],
              );
            });
          },
          child: Icon(
              Icons.add,
              color: Colors.white
          )
      ),
    );
  }
}

