import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetAlert extends StatefulWidget {
  const ResetAlert({super.key});

  @override
  State<ResetAlert> createState() => _ResetAlertState();
}

class _ResetAlertState extends State<ResetAlert> {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: const Text(
        'Are you sure you want to reset your journey?',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22),
      ),
      content: const Text(
        'If you reset , you will start at day one.'
        ' However, all your achievement will remain and'
        ' you can keep on collecting badges to level up.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('stateDay1$uid');
                prefs.remove('stateDay2$uid');
                prefs.remove('stateDay3$uid');
                prefs.remove('stateDay4$uid');
                prefs.remove('stateDay5$uid');
                prefs.remove('stateDay6$uid');
                prefs.remove('stateDay7$uid');

                prefs.remove('entered2$uid');
                prefs.remove('entered3$uid');
                prefs.remove('entered4$uid');
                prefs.remove('entered5$uid');
                prefs.remove('entered6$uid');
                prefs.remove('entered7$uid');

                prefs.setInt('firstday$uid', DateTime.now().weekday);
                // prefs.setInt("firstday$uid", int.parse(firstday));

                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', ModalRoute.withName('/'));
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  width: 1.0,
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Confirm',
                  style: TextStyle(color: Colors.redAccent, fontSize: 23)),
            ),
          ),
        ),
      ],
    );
  }
}
