import 'package:flutter/material.dart';
//import 'package:get/get.dart';

//import '../controllers/note_controller.dart';

class egEntry extends StatelessWidget {
  //final NoteController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          "Example Entry",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
          ),
          child: Column(
            children: [
              TextField(
                //controller: controller.titleController,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "New Years day",
                  hintStyle: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                    letterSpacing: 1,
                  ),
                  border: InputBorder.none,
                ),
              ),
              TextField(
                style: TextStyle(
                  fontSize: 22,
                ),
                //controller: controller.contentController,
                decoration: InputDecoration(
                  hintText: "◌ Launch fireworks",
                  hintStyle: TextStyle(
                    fontSize: 22,
                  ),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              TextField(
                style: TextStyle(
                  fontSize: 22,
                ),
                //controller: controller.contentController,
                decoration: InputDecoration(
                  hintText: "12:00:00 01/01/2022",
                  hintStyle: TextStyle(
                    fontSize: 22,
                  ),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              TextField(
                style: TextStyle(
                  fontSize: 22,
                ),
                //controller: controller.contentController,
                decoration: InputDecoration(
                  hintText: "Example Description",
                  hintStyle: TextStyle(
                    fontSize: 22,
                  ),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: () {controller.addNoteToDatabase();},
        onPressed: () {  },
        child: Icon(
          Icons.check,
        ),
      ),
    );
  }
}
