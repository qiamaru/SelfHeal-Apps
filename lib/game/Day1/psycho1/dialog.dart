import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_firebaseauth/badgeDialog/badgePsyDialog.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'dart:async';

class dialog extends StatelessWidget {
  const dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: const Text(
        'You spend your time wisely',
        textAlign: TextAlign.center,
      ),
      content: const Text('Hope you learn something new!',
          textAlign: TextAlign.center),
      actions: [
        Center(
            child: ElevatedButton(
                onPressed: (() {
                  Navigator.of(context).pop();
                  Timer(
                      const Duration(milliseconds: 200),
                      () => showAnimatedDialog<void>(
                          animationType: DialogTransitionType.fadeScale,
                          barrierDismissible: false,
                          duration: const Duration(milliseconds: 350),
                          context: context,
                          builder: (_) => const getPsyBadgeDialog()));
                  // Navigator.of(context).pop();
                }),
                child: const Text('OK')))
      ],
    );
  }
}
