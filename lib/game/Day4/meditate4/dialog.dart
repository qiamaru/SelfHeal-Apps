import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:test_firebaseauth/provider/status_provider.dart';
import 'package:test_firebaseauth/provider/isnotgreen_provider.dart';
import 'package:test_firebaseauth/badgeDialog/badgeMedDialog.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'dart:async';

class dialog extends StatelessWidget {
  const dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        'Congratulation. You found something to be grateful of.',
        textAlign: TextAlign.center,
      ),
      content: Text('Feel free to continue the list or you may exit.',
          textAlign: TextAlign.center),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: (() {
                                                                        String uid = FirebaseAuth.instance.currentUser!.uid;

                  if (Provider.of<Status>(context, listen: false).stat4 != 5 &&
                      Provider.of<IsNotGreen>(context, listen: false)
                          .isnotgreen) {
                    context.read<Status>().chg('d4', 3,uid);
                    context.read<IsNotGreen>().chg(true);
                  }
                  Navigator.of(context).pop();
                  Timer(
                      const Duration(milliseconds: 200),
                      () => showAnimatedDialog<void>(
                          animationType: DialogTransitionType.fadeScale,
                          barrierDismissible: false,
                          duration: const Duration(milliseconds: 350),
                          context: context,
                          builder: (_) => const getMedBadgeDialog()));
                }),
                child: Text('Continue')),
            ElevatedButton(
                onPressed: () {                                                      String uid = FirebaseAuth.instance.currentUser!.uid;

                  if (Provider.of<Status>(context, listen: false).stat4 != 5 &&
                      Provider.of<IsNotGreen>(context, listen: false)
                          .isnotgreen) {
                    context.read<Status>().chg('d4', 3,uid);
                    context.read<IsNotGreen>().chg(true);
                  }
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Timer(
                      const Duration(milliseconds: 200),
                      () => showAnimatedDialog<void>(
                          animationType: DialogTransitionType.fadeScale,
                          barrierDismissible: false,
                          duration: const Duration(milliseconds: 350),
                          context: context,
                          builder: (_) => const getMedBadgeDialog()));
                },
                child: Text('Exit')),
          ],
        ),
      ],
    );
  }
}
