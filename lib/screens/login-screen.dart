import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:organyzebullet_app/database/auth.dart';
import 'package:organyzebullet_app/pallete.dart';
import 'package:organyzebullet_app/screens/screens.dart';
import 'package:organyzebullet_app/widgets/widgets.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:organyzebullet_app/database/realtime_database_function.dart';


class LoginScreen extends StatelessWidget {
  loginAuth auth = new loginAuth();

  final _database = FirebaseDatabase.instance.reference();



  @override
  Widget build(BuildContext context) {

 

    final usero = TextEditingController();
    final emailo = TextEditingController();
    final passwordo = TextEditingController();


    usero.addListener(() => {});
    emailo.addListener(() => {});
    passwordo.addListener(() => {});

    Size size = MediaQuery.of(context).size; // from button

    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/images/login.png',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'Organyze Bullet',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    myController: emailo,
                  ),
                  PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done, inputType: null,
                    myController: passwordo,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                    child: Text(
                      'Forgot Password',
                      style: kBodyText,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.brown,
                  ),
                    child: Row(
                    children: <Widget>[
                    ElevatedButton(
                      onPressed: ()  {
                        //print(auth.signInEmail(emailo.text, passwordo.text) as String);
                        if (auth.signInEmail(emailo.text, passwordo.text) == 'signed-in') {
                                        if (auth.verifyEmailtoLogin() == 0) {
                                          print("verified email");
                                          Navigator.pushNamed(context,
                                              'viewNotebooks');
                                        }
                                        else{
                                          auth.sendverificationEmailWOChecking();
                                          print("not verified, Sending Email");}
                                        }
                                      else{print("Make sure password and email are correct");}
                                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            //side: BorderSide(color: Colors.red)
                            )
                          )
                      ),
                      child: Text(
                        "Login",
                        style:
                          kBodyText.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            await auth.signInWithGoogle();
                            Navigator.pushNamed(context,
                                'viewNotebooks');
                          },
                          child: Text(
                            "Login with Google",
                            style:
                            kBodyText.copyWith(fontWeight: FontWeight.bold),
                          ),
                      )
                    ]
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                  onTap: () => {
                    Navigator.pushNamed(context, 'viewNotebooks'),
                    //auth.anon()
                  },
                  child: Container(
                    child:Text(
                      'Guest login',
                      style: kBodyText,
                    ),
                    decoration: BoxDecoration(
                     border:
                       Border(bottom: BorderSide(width: 1, color: kWhite))),
                    ),
                  ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'CreateNewAccount'),
                child: Container(
                  child: Text(
                    'Create New Account',
                    style: kBodyText,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class loginAuth extends auth{


}