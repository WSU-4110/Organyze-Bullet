import 'dart:ui';
import 'package:organyzebullet_app/database/dataModel.dart';
import 'package:organyzebullet_app/database/message_dao.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:organyzebullet_app/pallete.dart';
import 'package:organyzebullet_app/widgets/widgets.dart';

// Example for Adapter Design no code from firebase
interface User
{
    public void signedUser();
    public void randomUser();
}
  
class NotebookURL implements User
{
    // a concrete implementation of bird
    public void signedUser()
    {
        System.out.println("Accessing");
    }
    public void randomUser()
    {
        System.out.println("Access Denied");
    }
}

interface GoogleSignIn
{
    public void signed();
}
  
class Google implements GoogleSignIn
{
    public void signed()
    {
        System.out.println("Make an account?");
    }
}
  
class SignInAdapter implements GoogleSignIn
{
    // You need to implement the interface your
    // client expects to use.
    User user;
    public SignInAdapter(User user)
    {
        // we need reference to the object we
        // are adapting
        this.user = user;
    }
  
    public void squeak()
    {
        // translate the methods appropriately
        user.makeSound();
    }
}
class Main
{
    public static void main(String args[])
    {
        NotebookURL notebook = new NotebookURL();
  
        GoogleSignIn signinAdapter = new SignInAdapter(user);
  
        System.out.println("User enter");
      // correct
        user.signedUser();
      // incorrect
        user.randomUser();
  
        System.out.println("Google");
      // ask to make an account
        google.signed();
  
        System.out.println("Adapter");
      // decline to make an account -> looks at Notebook URL
        signInAdapter.signedUser();
    }
}
