import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:test_firebaseauth/first_time_user/instruction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'main.dart';
// import 'package:dassquestionaire/instruction.dart';

class ts1 extends TextStyle {
  @override
  final Color color;
  @override
  final FontWeight fontWeight;
  final double size;
  @override
  final String fontFamily;

  const ts1({
    required this.color,
    required this.fontWeight,
    this.size = 22,
    this.fontFamily = 'Montserrat',
  }) : super(
          color: color,
          fontWeight: fontWeight,
          fontSize: size,
          fontFamily: fontFamily,
        );
}

List<String> list = <String>[
  'Normal',
  'Mild',
  'Moderate',
  'Severe',
  'Extremely Severe'
];

class DassResultView extends StatefulWidget {
  const DassResultView({super.key});

  @override
  State<DassResultView> createState() => _DassResultViewState();
}

class _DassResultViewState extends State<DassResultView> {
  String dropdownValue1 = list.first;
  String dropdownValue2 = list.first;
  String dropdownValue3 = list.first;

  // late String tempDepress;
  // late String tempAnxiety;
  // late String tempStress;

  final String userUID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("users/$userUID/DASS");

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
        body: SizedBox(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Text(
                  'What is the result of your test?',
                  style: TextStyle(fontSize: 23),
                  textAlign: TextAlign.left,
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      '1. Depression: ',
                      style:
                          ts1(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: DropdownButton(
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        value: dropdownValue1,
                        borderRadius: BorderRadius.circular(30),
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const ts1(
                                  color: Color(0xff2676BE),
                                  fontWeight: FontWeight.normal),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue1 = value!;
                          });
                        }),
                  )
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      '2. Anxiety: ',
                      style:
                          ts1(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 58.0),
                    child: DropdownButton(
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        value: dropdownValue2,
                        borderRadius: BorderRadius.circular(30),
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const ts1(
                                  color: Color(0xff2676BE),
                                  fontWeight: FontWeight.normal),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue2 = value!;
                          });
                        }),
                  )
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      '3. Stress: ',
                      style:
                          ts1(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 69.0),
                    child: DropdownButton(
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        value: dropdownValue3,
                        borderRadius: BorderRadius.circular(30),
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const ts1(
                                  color: Color(0xff2676BE),
                                  fontWeight: FontWeight.normal),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue3 = value!;
                          });
                        }),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 28)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)))),
                  onPressed: () async {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InstructionView()));
                    await ref.set({
                      "depression": dropdownValue1,
                      "anxiety": dropdownValue2,
                      "stress": dropdownValue3,
                    });
                  },
                  child: const Text('Next',
                      style: TextStyle(color: Colors.blue, fontSize: 23)),
                ),
              ),
            ],
          ),
        ));
  }
}
