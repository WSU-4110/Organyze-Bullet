import 'package:flutter/material.dart';
import 'package:organyzebullet_app/screens/add-entry.dart';
import 'package:organyzebullet_app/screens/eg-entry.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:organyzebullet_app/screens/home-screen.dart';
import 'package:organyzebullet_app/screens/view_entries.dart';
import 'screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:organyzebullet_app/database/realtime_database_function.dart';
import 'package:organyzebullet_app/database/dataModel.dart';
import 'package:organyzebullet_app/database/message_dao.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:organyzebullet_app/database/auth.dart';

void main() async {
  //await Firebase.initializeApp();
  //dbfunc oz = new dbfunc();
  //oz.createUser(2, 'username', 'email@email.com', 'password1');
  print("message");

  WidgetsFlutterBinding.ensureInitialized(); //this is IMPORTANT to not have a null error message
  await Firebase.initializeApp();
  int test = 0;
  authTest a = new authTest();
  //test =  await a.createUser("potato@gmail.com", "chimmychonka") as int;
  a.createUser("ibrahimik1012@gmail.com", "testPassword0987654321");
  a.signInEmail("ibrahimik1012@gmail.com", "testPassword0987654321");
  a.verifyEmail();
  print("this is the code for error" + test.toString());

  //runApp(MyApp());

}

/*class dbfunc extends realtime {
  @override
  Future<void> createUser(int ID, String username, String email, String password) async {
    final account = database.child('UID/');
    return Future.delayed(
        const Duration(milliseconds:1), () => account.set({'UID': ID,'Username':username,'Email':email,'Password':password}));
  }
}*/

class authTest extends auth{
  Future<void> anon();

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
   //final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Organyze Bullet',
      theme: ThemeData(
        //textTheme:GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      /*home: FutureBuilder(
        future: _fbApp,
            builder: (context,snapshot) {
              if(snapshot.hasError) {
                print('You have an error! ${snapshot.error.toString()}');
                return Text('Something went wrong');}
                else if (snapshot.hasData) {
                  return LoginScreen();}
                else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                  }
                },
      ),*/
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        'ForgotPassword': (context) => ForgotPassword(),
        'CreateNewAccount': (context) => CreateNewAccount(),
        'AddNewEntry': (context) => AddNewEntry(),
        'viewEntries': (context) => viewEntries(),
        'exampleEntry' : (context) => egEntry(),
        //'HomeScreen': (context) => HomeScreen(),
      },
    );



  }




}




