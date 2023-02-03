import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:mirulhotline/badgeDialog/badgePhyDialog.dart';

class getPhyBadgeDialog extends StatefulWidget {
  const getPhyBadgeDialog({super.key});

  @override
  State<getPhyBadgeDialog> createState() => _getPhyBadgeDialogState();
}

class _getPhyBadgeDialogState extends State<getPhyBadgeDialog> {
  late int counter;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  Future storePhyBadge(int count) async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
        DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");

    sharedPreferences.setInt("phyBadge$uid", count);
    ref.update({"phyBadge": count});
  }

  Future fetchPhyBadge() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    
    setState(() {
      counter = sharedPreferences.getInt("phyBadge$uid") ?? 0;
    });
  }

  @override
  void initState() {
    fetchPhyBadge();
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
                  backgroundImage: AssetImage('images/physic.png'),
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
            onPressed: (() {
              counter++;
              storePhyBadge(counter);
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
//                         builder: (_) => const getPhyBadgeDialog()));