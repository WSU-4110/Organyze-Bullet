import 'dart:async';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../main.dart';
//import 'package:firebase_auth/firebase_auth.dart';

void main() async {

  //await Firebase.initializeApp();
  //realtime r = new realtime();
  print("done");

  //await r.createUser(2, 'bob', 'bob@email.com', 'bobpassword');

}

class realtime {
  final database = FirebaseDatabase.instance.reference();
  //FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> createUser(int ID, String username, String email, String password) async {
    final account = database.child('UID/');
    return Future.delayed(
        const Duration(milliseconds:1), () => account.set({'UID': ID,'Username':username,'Email':email,'Password':password}));
}



}