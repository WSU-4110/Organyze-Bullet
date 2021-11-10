import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:organyzebullet_app/pallete.dart';
import 'package:organyzebullet_app/widgets/widgets.dart';
import 'dart:ui';
import 'package:flutter/services.dart';


class LoginScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
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
                  ),
                  PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done, inputType: null,
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
                  RoundedButton(
                    buttonName: 'Login',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'viewEntries'),
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