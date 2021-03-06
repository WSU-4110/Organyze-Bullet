import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organyzebullet_app/database/dataModels.dart';
import 'package:organyzebullet_app/database/realtime_database_function.dart';
import 'package:organyzebullet_app/screens/add-notebook.dart';
import 'package:organyzebullet_app/screens/view_notebooks.dart';
import 'screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:organyzebullet_app/database/dataModels.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:organyzebullet_app/database/auth.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();                         //this is IMPORTANT to not have a null error message
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    String initRoute = '/';
    if (FirebaseAuth.instance.currentUser !=null && (FirebaseAuth.instance.currentUser?.emailVerified == true)){
        initRoute = 'viewNotebooks';
    }
    else{
        initRoute = '/';
    }

    return MaterialApp(
      title: 'Organyze Bullet',
      theme: ThemeData(
        textTheme:
            GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: initRoute,
      routes: {
        '/': (context) => LoginScreen(),
        'ForgotPassword': (context) => ForgotPassword(),
        'CreateNewAccount': (context) => CreateNewAccount(),
        'AddNewEntry': (context) => AddNewEntry(),
        'viewEntries': (context) => viewEntries(),
        'viewNotebooks':(context) => viewNotebooks(),
        'AddNewNotebook':(context) => AddNewNotebook(),
        'settings-screen':(context) => Settings(),
        'updateEntry':(context) => updateEntry(),
        'viewSearch':(context) => viewSearch(),
        'add-search':(context) => addSearch(),
      },

    );



  }




}
