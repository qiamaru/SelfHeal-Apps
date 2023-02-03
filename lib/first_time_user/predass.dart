import 'package:test_firebaseauth/first_time_user/dasswebview.dart';
import 'package:flutter/material.dart';
// import './dassresult.dart';

class PreDassScreen extends StatefulWidget {
  const PreDassScreen({Key? key}) : super(key: key);

  // final String title;

  @override
  State<PreDassScreen> createState() => _PreDassScreenState();
}

class _PreDassScreenState extends State<PreDassScreen> {
  @override
  Widget build(BuildContext context) {
    var divHeight = MediaQuery.of(context).size.height;
    var divWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Text(
                      'We will start with a simple test that will help you know your level of mental health',
                      style: TextStyle(fontSize: 23, fontFamily: 'Arial'),
                      textAlign: TextAlign.center)),
              SizedBox(
                //sizedbox2
                height: 190,
                width: double.infinity,
                child: Column(
                  children: [
                    const Text('DASS Questionaire',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    Padding(
                      padding: EdgeInsets.only(top: 23.0),
                      child: Text('*Please take note of the test result',
                          style: TextStyle(
                              color: Colors.green.shade900,
                              fontSize: 20,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 63.0),
                      child: ElevatedButton(
                        // onPressed: _launchUrl,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DassWebView(
                                        divHeight: divHeight,
                                        divWidth: divWidth,
                                      )));
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(255, 36, 136, 218),
                            backgroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 28),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 39, vertical: 7),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('Start'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Image.asset(
                  'images/creditdasswenglish.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
