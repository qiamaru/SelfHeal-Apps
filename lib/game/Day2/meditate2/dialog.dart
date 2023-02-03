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
        'You spend your time well',
        textAlign: TextAlign.center,
      ),
      content: Text('Hope it motivates you to stay strong!',
          textAlign: TextAlign.center),
      actions: [
        Center(
            child: ElevatedButton(
                onPressed: (() {
                                                                        String uid = FirebaseAuth.instance.currentUser!.uid;

                  if (Provider.of<Status>(context, listen: false).stat2 != 5 &&
                      Provider.of<IsNotGreen>(context, listen: false)
                          .isnotgreen) {
                    context.read<Status>().chg('d2', 3,uid);
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
                child: Text('OK')))
      ],
    );
  }
}
