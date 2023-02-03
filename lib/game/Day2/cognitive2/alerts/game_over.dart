import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'provider/isnotgreen_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:test_firebaseauth/badgeDialog/badgeCogDialog.dart';

import '../../../../provider/isnotgreen_provider.dart';
import '../../../../provider/status_provider.dart';
import '../styles.dart';

class AlertGameOver extends StatefulWidget {
  static bool newGame = false;
  static bool restartGame = false;

  const AlertGameOver({Key? key}) : super(key: key);

  @override
  State<AlertGameOver> createState() => _AlertGameOverState();
}

class _AlertGameOverState extends State<AlertGameOver> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Styles.secondaryBackgroundColor,
      title: Text(
        'Splendid. You did it well',
        style: TextStyle(color: Styles.foregroundColor),
        textAlign: TextAlign.center,
      ),
      content: Text('You successfully solved the Sudoku',
          style: TextStyle(color: Styles.foregroundColor),
          textAlign: TextAlign.center),
      actions: [
        Center(
          child: ElevatedButton(
              //setInt for achievement
              onPressed: (() {
                String uid = FirebaseAuth.instance.currentUser!.uid;
                if (Provider.of<Status>(context, listen: false).stat2 != 5 &&
                    Provider.of<IsNotGreen>(context, listen: false)
                        .isnotgreen) {
                  context.read<Status>().chg('d2', 2, uid);
                  context.read<IsNotGreen>().chg(true);
                  print(Provider.of<IsNotGreen>(context, listen: false)
                      .isnotgreen);
                }
                Navigator.of(context).pop();
                Navigator.pop(context);
                Timer(
                    const Duration(milliseconds: 200),
                    () => showAnimatedDialog<void>(
                        animationType: DialogTransitionType.fadeScale,
                        barrierDismissible: false,
                        duration: const Duration(milliseconds: 350),
                        context: context,
                        builder: (_) => const getCogBadgeDialog()));
              }),
              child: const Text('OK')),
        )
      ],
    );
  }
}
