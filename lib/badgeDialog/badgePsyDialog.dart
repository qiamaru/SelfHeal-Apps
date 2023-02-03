import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_firebaseauth/finish.dart';
// import 'package:mirulhotline/badgeDialog/badgePsyDialog.dart';
// import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
// import 'dart:async';

class getPsyBadgeDialog extends StatefulWidget {
  const getPsyBadgeDialog({super.key});

  @override
  State<getPsyBadgeDialog> createState() => _getPsyBadgeDialogState();
}

class _getPsyBadgeDialogState extends State<getPsyBadgeDialog> {
  late int counter;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  Future storePsyBadge(int count) async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");

    sharedPreferences.setInt("psyBadge$uid", count);
    ref.update({"psyBadge": count});
  }

  Future fetchPsyBadge() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      counter = sharedPreferences.getInt("psyBadge$uid") ?? 0;
    });
  }

  @override
  void initState() {
    fetchPsyBadge();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var divHeight = MediaQuery.of(context).size.height;
    var divWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
              style: BorderStyle.solid, color: Colors.black, width: 3)),
      backgroundColor: const Color(0xffD9D9D9),
      title: const Text(
        'Congratulation for\n completing the activity.',
        style: TextStyle(
            fontSize: 20, fontFamily: 'Bs', fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.all(18),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text(
          'You received:',
          style: TextStyle(
              fontSize: 20, fontFamily: 'Bs', fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 40,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('images/psycho.png'),
                  backgroundColor: Color(0xffFFD700),
                ),
              ),
            ),
            SizedBox(width: divWidth * .02),
            const Text(
              "x1",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ]),
      actionsPadding: const EdgeInsets.only(bottom: 20),
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: (() async {
              counter++;
              storePsyBadge(counter);
              SharedPreferences? prefs = await SharedPreferences.getInstance();
              if (prefs.getInt('stateDay7$uid') == 5) {
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
                
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FinishView()));
              } else {
                Navigator.pop(context);
              }
            }),
            child: const Text('OK'),
          ),
        )
      ],
    );
  }
}

//to trigger use this
// Timer(
//                     const Duration(milliseconds: 200),
//                     () => showAnimatedDialog<void>(
//                         animationType: DialogTransitionType.fadeScale,
//                         barrierDismissible: false,
//                         duration: const Duration(milliseconds: 350),
//                         context: context,
//                         builder: (_) => const getPsyBadgeDialog()));