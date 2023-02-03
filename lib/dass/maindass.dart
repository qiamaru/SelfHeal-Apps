import 'dassresult.dart';
import 'dasswebview.dart';
import 'package:flutter/material.dart';
// import './dassresult.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        // '/dassresult': (context) => const DassView(),
        '/urltest': (context) => urltest(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xff8AD16A),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              //sizedbox1
              padding: EdgeInsets.only(top: 20.0, left: 10, right: 10),
              child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Text(
                      'We will start with a simple test that will help you know your level of mental health',
                      style: TextStyle(fontSize: 23, fontFamily: 'Arial'),
                      textAlign: TextAlign.center)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: SizedBox(
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
                    const Padding(
                      padding: EdgeInsets.only(top: 23.0),
                      child: Text('*Please take note of the test result',
                          style: TextStyle(
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
                          Navigator.pushNamed(context, '/urltest');
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: const Color.fromARGB(255, 36, 136, 218),
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 160.0),
              child: SizedBox(
                child: Image.asset(
                  'images/CreditDass.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
