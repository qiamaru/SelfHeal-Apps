import 'package:flutter/material.dart';
// import 'package:mirulhotline/badgeDialog/badgeMedDialog.dart';
// import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
// import 'dart:async';

class SaveSettingDialog extends StatefulWidget {
  const SaveSettingDialog({super.key});

  @override
  State<SaveSettingDialog> createState() => _SaveSettingDialogState();
}

class _SaveSettingDialogState extends State<SaveSettingDialog> {
  late int counter;

  @override
  void initState() {
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
        'Your changes has been saved.',
        style: TextStyle(
            fontSize: 18, fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      actionsPadding: const EdgeInsets.only(bottom: 20),
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: (() {
              Navigator.pop(context);
              Navigator.pop(context);
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
//                         builder: (_) => const SaveSettingDialog()));