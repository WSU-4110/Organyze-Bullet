import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


class auth {
  final database = FirebaseDatabase.instance.reference(); //not sure if i need this here -\._./-

  void anon() async {
    FirebaseAuth.instance.signInAnonymously();
  }

  String createUser(String emailInput, String passwordInput) {
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailInput,
          password: passwordInput
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return ('The account already exists for that email.');
      }
    } catch (e) {
      //print(e);
      return ("other error");
    }
    return ('Account-Created');
  }




  String signInEmail(String emailInput, String passwordInput) {
    String err = '';
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailInput,
          password: passwordInput
      );
      err = "Account-Created";
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print('No user found for that email.');
        err = ('No user found');
      } else if (e.code == "wrong-password") {
        print('Wrong password provided for that user.');
        err =  ("wrong password");
      }
    }catch (e){
      //print(e);
      print("testing error catch");
    }
    print("signed in");
    print(err);
    return "signed-in";
  }





  Future <void> verifyEmail() async {
    User? user = await FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      print("sent");
    }
  }

  Future <void> sendverificationEmailWOChecking() async {
    User? user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
      print("sent");
    }
  }

  int verifyEmailtoLogin() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && user.emailVerified) {
      return 0;

    }
    else {
      print("Email is not verified");
      return 1;
    }
  }//this function is only meant to be used for the login scree, might be better in a abtract class but this is easier to do

  String getCurrentUserID(){
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && user.uid != null){
      return user.uid as String;
    }
    else return "no uid";
  }

  void signoutEmail() {
     FirebaseAuth.instance.signOut();
  } // untested

  bool checkNullUser(){
    if(FirebaseAuth.instance.currentUser != null){return false;}else{return true;}
  }


}

