import 'dart:async';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dataModel.dart';

//import 'package:firebase_auth/firebase_auth.dart';

class MessageDao {
  final DatabaseReference _messagesRef =
  FirebaseDatabase.instance.reference().child('Users');

  void saveMessage(oUser message) {
    _messagesRef.push().set(message.toJson());
  }

  Query getMessageQuery() {
    return _messagesRef;
  }

}