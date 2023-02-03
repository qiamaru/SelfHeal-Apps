import 'package:flutter/material.dart';

// import 'package:mirulhotline/badgeDialog/badgeMedDialog.dart';
// import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
// import 'dart:async';

class DeleteConfirmDialog extends StatefulWidget {
  const DeleteConfirmDialog({super.key, required this.confirm});

  @override
  State<DeleteConfirmDialog> createState() => _DeleteConfirmDialogState();
  final bool confirm;
}

class _DeleteConfirmDialogState extends State<DeleteConfirmDialog> {
  // late int counter;
  bool cfrm = false;

  @override
  void initState() {
    cfrm = widget.confirm;
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
        'Delete Account',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.all(18),
      content: const Text(
        'Are you sure you want to delete your account? This action cannot be undone.',
        style: TextStyle(fontSize: 17),
        textAlign: TextAlign.center,
      ),
      actionsPadding: const EdgeInsets.only(bottom: 20),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: (() {
                setState(() {
                  cfrm = true;
                });
                Navigator.pop(context, cfrm);
              }),
              child: const Text('Confirm'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: ElevatedButton(
                onPressed: (() {
                  Navigator.pop(context);
                }),
                child: const Text('Cancel'),
              ),
            ),
          ],
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
//                         builder: (_) => const DeleteConfirmDialog()));