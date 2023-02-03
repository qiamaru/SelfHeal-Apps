import 'instruction.dart';
import 'package:flutter/material.dart';
// import 'main.dart';
import 'instruction.dart';

class ts1 extends TextStyle {
  final Color color;
  final FontWeight fontWeight;
  final double size;
  final String fontFamily;

  ts1({
    required this.color,
    required this.fontWeight,
    this.size = 22,
    this.fontFamily = 'Montserrat',
  })  : assert(color != null && fontWeight != null),
        super(
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

class DassView extends StatefulWidget {
  DassView({super.key});

  @override
  State<DassView> createState() => _DassViewState();
}

class _DassViewState extends State<DassView> {
  String dropdownValue1 = list.first;
  String dropdownValue2 = list.first;
  String dropdownValue3 = list.first;

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
        body: SizedBox(
          child: Column(
            children: [
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Text(
                  'What is the result of your test?',
                  style: TextStyle(fontSize: 23),
                  textAlign: TextAlign.left,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      '1. Depression: ',
                      style:
                          ts1(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
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
                              style: ts1(
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
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      '2. Anxiety: ',
                      style:
                          ts1(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 58.0),
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
                              style: ts1(
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
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      '3. Stress: ',
                      style:
                          ts1(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 69.0),
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
                              style: ts1(
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
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 10, horizontal: 28)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InstructionView()));
                  },
                  child: Text('Next',
                      style: TextStyle(color: Colors.blue, fontSize: 23)),
                ),
              ),
            ],
          ),
        ));
  }
}
