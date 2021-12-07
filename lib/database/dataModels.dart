


import 'dart:convert';

import 'package:flutter/cupertino.dart';

class userModel{

  final String username;
  final String email;
  final String ID;



  userModel({required this.username, required this.email,required this.ID});



  factory userModel.fromtRTDB(Map<String,dynamic> data){
    return userModel(
        username: data['Username'] as String,
        email: data['email'] as String,
        ID: data['id'] as String);
  }
  
  String getUsername(){
    return this.username as String;
  }

  String getEmail(){
    return this.email;
  }

}



class notebookModel{
  final String notebookName;
  final String notebookID;

  notebookModel({required this.notebookName,required this.notebookID});

  factory notebookModel.fromRTDB(Map<String,dynamic> data){
    return notebookModel(
        notebookID: data['notebookID'] ?? "Null notebookID" as String,
        notebookName: data['notebookname'] ?? "Null Notebookname" as String,
    );
  }

}

class entryModel{
  final String entryName;
  final String date;
  final String UID;
  final String description;
  final String entryType;


  entryModel({required this.description, required this.date, required this.UID, required this.entryType, required this.entryName});

  factory entryModel.fromRTDB(Map<String,dynamic> data){
    return entryModel(
        description: data['description'],// ?? 'Enter a description', //as String,// ?? 'Enter a description',
        UID: data['entry-id'],// ?? '-0',// as String,// ?? '-0',
        entryName: data['name'],// ?? 'Enter a Entry name',// as String,// ?? 'Enter a Entry name',
        entryType: data['type'],// ?? 'Enter a Entry type',// as String,// ?? 'Enter a Entry type',
        date: data['timestamp'],// ?? '000'// as String// ?? "00/00/00"
    );
  }
}