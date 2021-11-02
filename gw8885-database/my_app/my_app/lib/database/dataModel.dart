import 'dart:async';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


//import 'package:firebase_auth/firebase_auth.dart';


class oUser {
  final String username;
  final int id;
  final String email;
  final String password;

  oUser(this.username, this.id,this.email,this.password);

  oUser.fromJson(Map<dynamic, dynamic> json)
      :username = json['Username'] as String,
       id = json['id'] as int,
        email = json['Email'] as String,
        password = json['Password'] as String;


  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'Username' : username,
    'id': id.toString(),
    'Email':email,
    'Password' : password

  };

}