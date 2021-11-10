import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';



class auth{
  final database = FirebaseDatabase.instance.reference();//not sure if i need this here -\._./-

  Future<void> anon() async{
  return Future.delayed(
      const Duration(milliseconds:1), () => FirebaseAuth.instance.signInAnonymously());
  }

  Future<void> createUser(String emailInput,String passwordInput) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailInput,
          password: passwordInput
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
       // return Future.delayed(const Duration(milliseconds:1), () => 1);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        //return Future.delayed(const Duration(milliseconds:1), () => 2);
      }
    } catch (e) {
      print(e);
    }
    //return Future.delayed(const Duration(milliseconds:1), () => 0);
  }

  Future <void> signInEmail(String emailInput,String passwordInput) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailInput,
          password: passwordInput
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    }

  Future <void> verifyEmail() async {

      User? user = await FirebaseAuth.instance.currentUser;
      if (user!= null && !user.emailVerified) {
        await user.sendEmailVerification();
        print("sent");
      }

    }


  Future <void> signoutEmail() async {
    await FirebaseAuth.instance.signOut();
  } // untested
}
