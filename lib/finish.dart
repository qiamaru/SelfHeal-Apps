import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_firebaseauth/reset_dialogue.dart';
import 'package:flutter/material.dart';

class FinishView extends StatefulWidget {
  const FinishView({super.key});

  @override
  State<FinishView> createState() => _FinishViewState();
}

class _FinishViewState extends State<FinishView> {
  @override
  Widget build(BuildContext context) {
    var divHeight = MediaQuery.of(context).size.height;
    var divWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff8AD16A),
      appBar: AppBar(
        toolbarHeight: divHeight * 0.1,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              padding: const EdgeInsets.all(15),
              child: Image.asset('images/logo_appBar.png', fit: BoxFit.fill),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: divHeight * .02),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  child: const Text(
                    'Congratulations!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                  decoration: BoxDecoration(
                      color: const Color(0Xff8AB369).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(50)),
                  // constraints: BoxConstraints(maxHeight: 310, maxWidth: 378),
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        children: [
                          // TextSpan(
                          //     text: 'Disclaimer:\n',
                          //     style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  'Congratulations, you have completed the self-healing process.'
                                  'The different modules that are being provided, it gives you the '
                                  'big picture that there are so many goals in our life that we can '
                                  'achieve.  We hope that this app at least helps you to find your true self again.'),
                        ]),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    '\n\nThe Prophet (pbuh) said, “All the sons of Adam are sinners, but the '
                    'best of sinners are those who repent often”\n(Tirmidthi, Ibn Majah).',
                    style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 4, 51, 88)),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            children: [
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30.0,
                  color: Colors.blue,
                ),
                label: const Text('Stay',
                    style: TextStyle(color: Colors.blue, fontSize: 23)),
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.pop(context);
                  // Navigator.pop(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    // padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                    //   horizontal: 18,
                    // )),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)))),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.refresh_rounded,
                  size: 40.0,
                  color: Colors.red,
                ),
                label: const Text('Reset journey',
                    style: TextStyle(color: Colors.red, fontSize: 20)),
                onPressed: () {
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (_) {
                      return const ResetAlert();
                    }, // init state
                  );
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    // padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                    //   horizontal: 18,
                    // )),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
