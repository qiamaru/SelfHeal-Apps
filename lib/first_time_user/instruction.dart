import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
// import 'main.dart';
import 'package:test_firebaseauth/first_time_user/disclaimer.dart';

class InstructionView extends StatefulWidget {
  const InstructionView({super.key});

  @override
  State<InstructionView> createState() => _InstructionViewState();
}

class _InstructionViewState extends State<InstructionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              padding: const EdgeInsets.all(15),
              child: Image.asset('images/logoappBar.png', fit: BoxFit.fill),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 110),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 40),
                // height: 250,
                // width: 350,
                decoration: BoxDecoration(
                    color: const Color(0Xff8AB369).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(50)),
                constraints:
                    const BoxConstraints(maxHeight: 310, maxWidth: 378),
                child: RichText(
                    text: const TextSpan(
                        style: TextStyle(fontSize: 26, color: Colors.black),
                        children: [
                          TextSpan(text: 'You will undergo\n'),
                          TextSpan(
                              text: '7 Days of Self-healing\n',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  'journey that will help you calm down and distract you from negative thought\n\nAre you Ready? '),
                        ]),
                    textAlign: TextAlign.center),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DisclaimerView()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 22, vertical: 15)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)))),
              child: Text(
                'I\'m Ready',
                style: TextStyle(color: Colors.blue, fontSize: 23),
              ),
            )
          ],
        ),
      ),
    );
  }
}
