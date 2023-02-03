import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class DisclaimerView extends StatefulWidget {
  const DisclaimerView({super.key});

  @override
  State<DisclaimerView> createState() => _DisclaimerViewState();
}

class _DisclaimerViewState extends State<DisclaimerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              padding: EdgeInsets.all(15),
              child: Image.asset('images/logoappBar.png', fit: BoxFit.fill),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 60, 20, 40),
                // height: 250,
                // width: 350,
                decoration: BoxDecoration(
                    color: Color(0Xff8AB369).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(50)),
                constraints: BoxConstraints(maxHeight: 310, maxWidth: 378),
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(fontSize: 26, color: Colors.black),
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
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              icon: Icon(
                Icons.arrow_right_alt_outlined,
                size: 40.0,
                color: Colors.blue,
              ),
              label: Text('Next',
                  style: TextStyle(color: Colors.blue, fontSize: 23)),
              onPressed: () {},
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
