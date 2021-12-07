import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organyzebullet_app/main.dart';
import 'package:organyzebullet_app/database/realtime_database_function.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:organyzebullet_app/database/Publishers.dart';
import '../pallete.dart';
import 'package:organyzebullet_app/database/dataModels.dart';

class viewEntries extends StatelessWidget{
  // final controller = Get.put(NoteController());
  final _database = FirebaseDatabase.instance.reference();
  final String ID = FirebaseAuth.instance.currentUser!.uid;//as String;

  @override
  Widget build(BuildContext context) {

    if(FirebaseAuth.instance.currentUser?.uid != null){
      print ("User is:");
      print(FirebaseAuth.instance.currentUser!.uid);
    }
    else {print("null user");}
    final notebookName = ModalRoute.of(context)!.settings.arguments as String;
    String path = 'Users/$ID/Notebooks/$notebookName/entries/';
    print(path);
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: const Text(
          "Entries",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings), onPressed: () =>Navigator.pushNamed(context, 'settings-screen'),
            //onPressed: () {showSearch(context: context, delegate: SearchBar());},
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
      body: StreamBuilder(
          stream: _database.child(path).onValue,
          builder: (context, snapshot) {
            final tilesList = <ListTile>[];
            if(snapshot.hasError == false){
              final entryList = Map<String,dynamic>.from((snapshot.data! as Event).snapshot.value);
              entryList.forEach((key, value) {
                final nextEntry = Map<String,dynamic>.from(value);
                final orderTile = ListTile(
                    onLongPress: () {
                      String eUID = nextEntry["entry_id"];
                      _database.child("$path$eUID").remove();
                    },
                    onTap: () {
                      String eUID = nextEntry["entry_id"];
                      String newPath = '$path$eUID';
                      Navigator.pushNamed(context, 'updateEntry', arguments:newPath);
                    },
                   // trailing: Text(nextEntry.date), //or icon
                    title: Text(nextEntry['name']),
                    subtitle: Text(nextEntry['description']),
                    leading: Icon(setIcon(nextEntry['type']))
                );
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
          Navigator.pushNamed(context, 'AddNewEntry', arguments:notebookName);
        },
        child: Icon(
          Icons.add,
        ),
      ),


    );

  }
  IconData setIcon(String type) {
    IconData icon = CupertinoIcons.rectangle_fill_badge_xmark;
    if (type == "task"){icon = CupertinoIcons.circle;}
    else if(type == "complete"){icon = CupertinoIcons.xmark;}
    else if(type == "event"){icon = CupertinoIcons.circle_filled;}
    return icon;
  }
}


