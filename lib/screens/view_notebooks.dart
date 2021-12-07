import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organyzebullet_app/database/dataModels.dart';
import 'package:organyzebullet_app/main.dart';
import 'package:organyzebullet_app/database/realtime_database_function.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:organyzebullet_app/database/Publishers.dart';
import 'package:organyzebullet_app/screens/screens.dart';
import '../pallete.dart';



class viewNotebooks extends StatelessWidget {
 // final controller = Get.put(NoteController());
  final _database = FirebaseDatabase.instance.reference();
  final ID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    if(FirebaseAuth.instance.currentUser?.uid != null){
      print ("User is:");
      print(FirebaseAuth.instance.currentUser!.uid);
    }
    //final ID = ModalRoute.of(context)!.settings.arguments as String;
    String path = 'Users/$ID/Notebooks/';
    print(path);
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          "Notebooks",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white70,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share), onPressed: () => Navigator.pushNamed(context, 'add-search'),
          ),
          SizedBox(height: 25, width: 10),
          IconButton(
            icon: Icon(Icons.settings), onPressed: () => Navigator.pushNamed(context, 'settings-screen'),
          ),
          SizedBox(height: 25, width: 10)
        ],
      ),
      body: StreamBuilder(
          stream: _database.child(path).onValue,
          builder: (context, snapshot) {
            final tilesList = <ListTile>[];
            print(00);
            if(snapshot.hasError == false){
              final notebookList = Map<String,dynamic>.from((snapshot.data! as Event).snapshot.value);
              print(11);
              notebookList.forEach((key, value) {
                print(22);
                final nextNotebook = Map<String,dynamic>.from(value);
                print(33);
                final orderTile = ListTile(
                    leading: Icon(Icons.list),
                    onLongPress: () {
                      print(tilesList.length);
                      print("notebookLenght");
                      if(tilesList.length == 1){
                        print("Cant delete this notebook");
                      }
                      else {
                        String notebooknameD = nextNotebook['notebookname'];
                        _database.child('Users/$ID/Notebooks/$notebooknameD/')
                            .remove();
                      }
                    },
                    onTap: () {
                      String notebooknameB = nextNotebook['notebookname'];
                      print(notebooknameB);
                      Navigator.pushNamed(context, "viewEntries",arguments: notebooknameB);
                    },
                    title: Text(nextNotebook['notebookname']));
                tilesList.add(orderTile);
              }
              );
            }
            else {
              final tilesList = <ListTile>[];
              tilesList.add(ListTile(
                  leading: Icon(Icons.list),
                  title: Text("No Notebook Created")
              ));}
            //ListView.builder(
            //   itemCount: 5,
            //  itemBuilder: (BuildContext context, int index) {
              return
                ListView(
                  children: tilesList,
                );
            // }
            //);
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Get.to(AddNewNotePage());
          Navigator.pushNamed(context, 'AddNewNotebook');
          },
        child: Icon(
          Icons.add,
        ),
      ),
    );


  }
  String nullNotebookPathCheck(String id){
    if(_database.child('Users/$id/Notebooks/').onValue != null){
      return 'Users/$id/Notebooks/';
    }
    else{
      return 'Users/nullPlacer/Notebooks';
    }

  }


  final Map<String, dynamic> nullSafeMap = {
      "notebookName": "no notebooks available",
      "notebookID": 2,
  };
}
