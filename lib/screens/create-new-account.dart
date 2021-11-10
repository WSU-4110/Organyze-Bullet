import 'dart:ui';
import 'package:organyzebullet_app/database/dataModel.dart';
import 'package:organyzebullet_app/database/message_dao.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:organyzebullet_app/database/auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:organyzebullet_app/pallete.dart';
import 'package:organyzebullet_app/widgets/widgets.dart';



class CreateNewAccount extends StatelessWidget {
  //final Future<database> = FirebaseDatabase.instance.reference();
  //FirebaseAuth auth = FirebaseAuth.instance;
    authCreateAcc auth = new authCreateAcc();


  @override
  Widget build(BuildContext context) {
    int idNumo = 1;
    int createErrCode = 0; // zero is no error at all, 1 is the password is too low, 2 is the email is already registers
    //final account = database.child('UID/');
    final usero = TextEditingController();
    final emailo = TextEditingController();
    final passwordo = TextEditingController();
    final passwordchecko = TextEditingController();


    usero.addListener(() => print('first text field: ${usero.text}'));
    emailo.addListener(() => print('second text field: ${emailo.text}'));
    passwordo.addListener(() => print('password text field: ${passwordo.text}'));
    passwordchecko.addListener(() => print('check text field: ${passwordchecko.text}'));

    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/images/reg.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400]!.withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: kWhite,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: kBlue,
                          shape: BoxShape.circle,
                          border: Border.all(color: kWhite, width: 2),
                        ),
                        child: Icon(
                          FontAwesomeIcons.arrowUp,
                          color: kWhite,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
                    TextInputField(
                      icon: FontAwesomeIcons.user,
                      hint: 'User',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      myController: usero,

                    ),
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
                      inputAction: TextInputAction.next,
                      myController: passwordo,
                    ),
                    PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Confirm Password',
                      inputAction: TextInputAction.done,
                      myController: passwordchecko,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        idNumo = idNumo + 1,
                        createUserWError(usero.text, emailo.text, passwordo.text, passwordchecko.text)
                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Text(
                          "Create Account"
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            'Login',
                            style: kBodyText.copyWith(
                                color: kBlue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
       // FutureBuilder()
      ],

    );



  }


  Future<void> createUserWError(String User, String emailInput,String passwordInput,String confirmedPassword) async {
    int createErrCode = 0;
    if (passwordInput == confirmedPassword) {
      auth.createUser(emailInput, passwordInput);
    }
    else{
      createErrCode = 3;
    }
    //return createErrCode;
  }


  void _sendMessage(String nameWrite,int idNum, String emailWrite, String passwordWrite) {
    if (_canSendMessage()) {
      final message = oUser(nameWrite, idNum ,emailWrite,passwordWrite);
      final messageDao = MessageDao();
      print("hi");
      messageDao.saveMessage(message);
    }
  }

  bool _canSendMessage() => true;




}



  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  class authCreateAcc extends auth {}



  class MessageList extends StatefulWidget {
  MessageList({Key? key}) : super(key: key);

  final messageDao = MessageDao();

  @override
  State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
  }

  //MessageListState createState() => MessageListState();
  }



