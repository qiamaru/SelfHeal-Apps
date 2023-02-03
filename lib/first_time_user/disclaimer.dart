import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_firebaseauth/first_time_user/introduction_slide.dart';

class DisclaimerView extends StatefulWidget {
  const DisclaimerView({
    super.key,
  });

  @override
  State<DisclaimerView> createState() => _DisclaimerViewState();
}

class _DisclaimerViewState extends State<DisclaimerView> {
  final String uid = FirebaseAuth.instance.currentUser!.uid;

//this method should be called only once at disclaimer view and under contain.key cause it relate w UID
  Future setUIDfirstday() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (!sharedPreferences.containsKey('firstday$uid')) {
        int firstday = DateTime.now().weekday;
        sharedPreferences.setInt("firstday$uid", firstday);
        ref.update({
          "firstday": firstday,
        });
        print('set firstday untuk pertama kalinya');
        // sharedPreferences.reload();
      } else {
        var daydlmSP = sharedPreferences.getInt("firstday$uid");
        print('first day dah pernah ada dah : $daydlmSP');
        print(uid);
      }
    });
  }

  @override
  void initState() {
    setUIDfirstday();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");

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
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(18.0),
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
                        style: TextStyle(fontSize: 24, color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'Disclaimer:\n',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  'This is just an aid to help you\nmanage your mental health'),
                          TextSpan(
                              text:
                                  '\n\nShould your condition is severe, we advise you to seek professional help'),
                        ]),
                    textAlign: TextAlign.center),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Text(dass),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.arrow_right_alt_outlined,
                size: 40.0,
                color: Colors.blue,
              ),
              label: const Text('Next',
                  style: TextStyle(color: Colors.blue, fontSize: 23)),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool("donefirsttime$uid", true);
                // Navigator.pushNamed(context, '/home');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IntroductionSlide()));
                prefs.reload();
                await ref.update({"donefirsttime": true});
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  // padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                  //   horizontal: 18,
                  // )),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)))),
            )
          ],
        ),
      ),
    );
  }
}
