import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'predass.dart';
import 'package:flutter/material.dart';

//color self -> 0xff265B0F
//color heal -> 0xff5EC831

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});
  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  TextEditingController usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var divHeight = MediaQuery.of(context).size.height;
    var divWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        // padding: EdgeInsets.all(20),
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      style: TextStyle(fontSize: 30, color: Colors.black),
                      children: [
                        TextSpan(text: 'Welcome to'),
                        TextSpan(
                            text: ' Self',
                            style: TextStyle(
                                color: Color(0xff265B0F),
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'Heal',
                            style: TextStyle(
                                color: Color(0xff5EC831),
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '\n\nA journey to manage\nyour mental health',
                            style: TextStyle(
                                color: Color(0xff363835),
                                fontWeight: FontWeight.bold,
                                fontSize: 26)),
                      ]),
                )),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Text('Enter your name:',
                        style:
                            TextStyle(color: Color(0xff363835), fontSize: 26)),
                  ),
                  SizedBox(
                    width: divWidth * .5,
                    // height: 40,
                    child: TextFormField(
                      controller: usernamecontroller,
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      style: const TextStyle(fontSize: 18),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        // border: OutlineInputBorder(),
                        // hintText: 'Enter your name here',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 28)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)))),
                onPressed: () async {
                  if (usernamecontroller.text == '') {
                    return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.black,
                                    width: 1)),
                            title: const Text(
                              'Name is empty!',
                              textAlign: TextAlign.center,
                            ),
                            contentPadding: const EdgeInsets.all(10),
                            titlePadding: null,
                            insetPadding: const EdgeInsets.all(2),
                            buttonPadding: const EdgeInsets.all(10),
                            content: const Text(
                              'Please enter a name.',
                              textAlign: TextAlign.center,
                            ),
                            actions: <Widget>[
                              Center(
                                child: ElevatedButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ],
                          );
                        });
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PreDassScreen()));
                  }

                  final String userUID = FirebaseAuth.instance.currentUser!.uid;
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  DatabaseReference ref =
                      FirebaseDatabase.instance.ref("users/$userUID");

                  prefs.setString("username$userUID", usernamecontroller.text);
                  ref.set({
                    "username": usernamecontroller.text,
                    "stateDay1": 0,
                    "stateDay2": 0,
                    "stateDay3": 0,
                    "stateDay4": 0,
                    "stateDay5": 0,
                    "stateDay6": 0,
                    "stateDay7": 0,
                    "cogBadge": 0,
                    "medBadge": 0,
                    "phyBadge": 0,
                    "psyBadge": 0,
                    "lvlCog": 1,
                    "lvlMed": 1,
                    "lvlPhy": 1,
                    "lvlPsy": 1,
                    "currentCapCog": 5,
                    "currentCapMed": 5,
                    "currentCapPhy": 5,
                    "currentCapPsy": 5,
                    // "divisionCog": 0.0,
                    // "divisionMed": 0.0,
                    // "divisionPhy": 0.0,
                    // "divisionPsy": 0.0,
                  });
                },
                child: const Text('Next',
                    style: TextStyle(color: Colors.blue, fontSize: 23)),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
