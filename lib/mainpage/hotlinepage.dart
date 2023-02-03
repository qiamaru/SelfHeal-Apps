import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class phonefont {
  static const TextStyle nameOfTextStyle = TextStyle(
    fontSize: 20,
    shadows: [Shadow(color: Colors.blue, offset: Offset(0, -2.2))],
    color: Colors.transparent,
    decoration: TextDecoration.underline,
    decorationThickness: 2,
    decorationColor: Colors.blue,
    fontWeight: FontWeight.bold,
  );
}

class descfont {
  static const TextStyle nameOfTextStyle = TextStyle(
    fontSize: 20,
    color: Colors.black,
  );
}

class header {
  static const TextStyle nameOfTextStyle = TextStyle(
      fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xff333333));
}

class timefont {
  static const TextStyle nameOfTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    shadows: [Shadow(color: Colors.black, offset: Offset(0, -2.2))],
    color: Colors.transparent,
    decorationThickness: 2,
  );
}

const String tkasih = '15999';
const String bfdkl = '03-76272929';
const String bfdipoh = '05-5477933';
const String bfdpenang = '04-2815161';
const String miasa1 = '03-77322414';
const String miasa2 = '013-8781322';
const String miasa3 = '019-2362423';
const String trwell = '018-9003247';
const String mmha = '03-27806803';
const String theal = '15555';

final Uri _tkasih = Uri(scheme: 'tel', path: tkasih);
final Uri _bfdkl = Uri(scheme: 'tel', path: bfdkl);
final Uri _bfdipoh = Uri(scheme: 'tel', path: bfdipoh);
final Uri _bfdpenang = Uri(scheme: 'tel', path: bfdpenang);
final Uri _miasa1 = Uri(scheme: 'tel', path: miasa1);
final Uri _miasa2 = Uri(scheme: 'tel', path: miasa2);
final Uri _miasa3 = Uri(scheme: 'tel', path: miasa3);
final Uri _trwell = Uri(scheme: 'tel', path: trwell);
final Uri _mmha = Uri(scheme: 'tel', path: mmha);
final Uri _theal = Uri(scheme: 'tel', path: theal);

const String sp2 = '\t\t';

class Hotline extends StatelessWidget {
  const Hotline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xff8AD16A),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Hotline',
                style: TextStyle(
                    fontSize: 35,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
                child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: <Widget>[
                Container(
                  key: const Key('Container-tkasih'),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: const Color(0XffD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: const Color(0xff1BDAF1), width: 6)),
                  // constraints: BoxConstraints(maxHeight: 310, maxWidth: 378),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Talian Kasih',
                        style: header.nameOfTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Table(
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(6),
                          },
                          children: [
                            TableRow(children: [
                              const Icon(
                                Icons.phone_forwarded_sharp,
                                size: 23,
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      children: [
                                    TextSpan(
                                        text: tkasih,
                                        style: phonefont.nameOfTextStyle,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            UrlLauncher.launchUrl(_tkasih);
                                            // await FlutterPhoneDirectCaller.callNumber(
                                            //     number);
                                          }),
                                    const TextSpan(
                                      text: '  (24 hours)',
                                      style: timefont.nameOfTextStyle,
                                    ),
                                  ]))
                            ]),
                          ],
                        ),
                      ),
                      const Text(
                          textAlign: TextAlign.justify,
                          style: descfont.nameOfTextStyle,
                          'Talian Kasih is a community concern line that can be accessed by the public. The service, which operates 24 hours a day, serves as a \'single point of contact\' for all that covers aspects related to abuse, counseling, protection, welfare, child lines, infant abandonment, reproductive health services and adolescent social problems.'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  key: const Key('Container-befrienders'),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: const Color(0XffD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: const Color(0xffD486E1), width: 6)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Befrienders',
                        style: header.nameOfTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Table(
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(6),
                          },
                          // border: TableBorder.all(),
                          // defaultVerticalAlignment:
                          //     TableCellVerticalAlignment.top,
                          children: [
                            TableRow(children: [
                              const Icon(
                                Icons.phone_forwarded_sharp,
                                size: 23,
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        // wordSpacing: 12
                                        // height: 1.3,
                                      ),
                                      children: [
                                    const TextSpan(
                                        text: 'KL:  ',
                                        style: timefont.nameOfTextStyle),
                                    TextSpan(
                                        text: bfdkl,
                                        style: phonefont.nameOfTextStyle,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            UrlLauncher.launchUrl(_bfdkl);
                                            // await FlutterPhoneDirectCaller.callNumber(
                                            //     number);
                                          }),
                                    const TextSpan(
                                      text: '\n(24 hours)',
                                      style: timefont.nameOfTextStyle,
                                    ),
                                  ]))
                            ]),
                            TableRow(children: [
                              const SizedBox.shrink(),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: RichText(
                                    text: TextSpan(
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        children: [
                                      const TextSpan(
                                        text: 'Ipoh:  ',
                                        style: timefont.nameOfTextStyle,
                                      ),
                                      TextSpan(
                                          text: bfdipoh,
                                          style: phonefont.nameOfTextStyle,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              UrlLauncher.launchUrl(_bfdipoh);
                                              // await FlutterPhoneDirectCaller.callNumber(
                                              //     number);
                                            }),
                                      const TextSpan(
                                        text: '\n(4pm to 11pm)',
                                        style: timefont.nameOfTextStyle,
                                      ),
                                    ])),
                              )
                            ]),
                            TableRow(children: [
                              const SizedBox.shrink(),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: RichText(
                                    text: TextSpan(
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        children: [
                                      const TextSpan(
                                        text: 'Penang:  ',
                                        style: timefont.nameOfTextStyle,
                                      ),
                                      TextSpan(
                                          text: bfdpenang,
                                          style: phonefont.nameOfTextStyle,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              UrlLauncher.launchUrl(_bfdpenang);
                                              // await FlutterPhoneDirectCaller.callNumber(
                                              //     number);
                                            }),
                                      const TextSpan(
                                        text: '\n(3pm to 12am)',
                                        style: timefont.nameOfTextStyle,
                                      ),
                                    ])),
                              )
                            ]),
                          ],
                        ),
                      ),
                      const Text(
                          textAlign: TextAlign.justify,
                          style: descfont.nameOfTextStyle,
                          'Befrienders is a not-for-profit organisation providing emotional support 24 hours a day, 7 days a week, to people who are lonely, in distress, in despair, and having suicidal thoughts - without charge.'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  key: const Key('Container-theal'),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: const Color(0XffD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: const Color.fromARGB(255, 54, 20, 157),
                          width: 6)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Talian Heal',
                        style: header.nameOfTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Table(
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(6),
                          },
                          // border: TableBorder.all(),
                          // defaultVerticalAlignment:
                          //     TableCellVerticalAlignment.top,
                          children: [
                            TableRow(children: [
                              const Icon(
                                Icons.phone_forwarded_sharp,
                                size: 23,
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      children: [
                                    TextSpan(
                                        text: theal,
                                        style: phonefont.nameOfTextStyle,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            UrlLauncher.launchUrl(_theal);
                                            // await FlutterPhoneDirectCaller.callNumber(
                                            //     number);
                                          }),
                                    const TextSpan(
                                      text: '  (8am to 12am)',
                                      style: timefont.nameOfTextStyle,
                                    ),
                                  ]))
                            ]),
                          ],
                        ),
                      ),
                      const Text(
                          textAlign: TextAlign.justify,
                          style: descfont.nameOfTextStyle,
                          'This crisis line service is managed by Counseling Psychologists.'
                          ' Among the scope of the service:\n\n'
                          '- Depression\n'
                          '- Stress\n'
                          '- Anxiety/panic attacks\n'
                          '- Suicidal behavior\n'
                          '- Post-vention support'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  key: const Key('Container-MIASA'),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: const Color(0XffD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: const Color(0xffFD9727), width: 6)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: 'MIASA', style: header.nameOfTextStyle),
                          TextSpan(
                              text:
                                  '\nMental Illness Awareness & Support Association',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff333333)))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Table(
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(6),
                          },
                          // border: TableBorder.all(),
                          // defaultVerticalAlignment:
                          //     TableCellVerticalAlignment.top,
                          children: [
                            TableRow(children: [
                              const Icon(
                                Icons.phone_forwarded_sharp,
                                size: 23,
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      children: [
                                    TextSpan(
                                        text: miasa1,
                                        style: phonefont.nameOfTextStyle,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            UrlLauncher.launchUrl(_miasa1);
                                            // await FlutterPhoneDirectCaller.callNumber(
                                            //     number);
                                          }),
                                  ]))
                            ]),
                            TableRow(children: [
                              const SizedBox.shrink(),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: RichText(
                                    text: TextSpan(
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        children: [
                                      TextSpan(
                                          text: miasa2,
                                          style: phonefont.nameOfTextStyle,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              UrlLauncher.launchUrl(_miasa2);
                                              // await FlutterPhoneDirectCaller.callNumber(
                                              //     number);
                                            }),
                                    ])),
                              )
                            ]),
                            TableRow(children: [
                              const SizedBox.shrink(),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: RichText(
                                    text: TextSpan(
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        children: [
                                      TextSpan(
                                          text: miasa3,
                                          style: phonefont.nameOfTextStyle,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              UrlLauncher.launchUrl(_miasa3);
                                              // await FlutterPhoneDirectCaller.callNumber(
                                              //     number);
                                            }),
                                    ])),
                              )
                            ]),
                            TableRow(children: [
                              const SizedBox.shrink(),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: RichText(
                                    text: const TextSpan(
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        children: [
                                      TextSpan(
                                        text: '*Additional charges may apply',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16),
                                      ),
                                    ])),
                              )
                            ]),
                          ],
                        ),
                      ),
                      const Text(
                          textAlign: TextAlign.justify,
                          style: descfont.nameOfTextStyle,
                          'MIASA offers various programs for patients and carers including:\n'
                          '\n• Support Group\n'
                          '• Therapeutic Assessment\n'
                          '• Circle Time & Support Programmes\n'
                          '• Islamic spiritual therapy'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  key: const Key('Container-thrivewell'),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: const Color(0XffD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: const Color(0xff269271), width: 6)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Thrive Well',
                        style: header.nameOfTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Table(
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(6),
                          },
                          children: [
                            TableRow(children: [
                              const Icon(
                                Icons.phone_forwarded_sharp,
                                size: 23,
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      children: [
                                    TextSpan(
                                        text: trwell,
                                        style: phonefont.nameOfTextStyle,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            UrlLauncher.launchUrl(_trwell);
                                            // await FlutterPhoneDirectCaller.callNumber(
                                            //     number);
                                          }),
                                  ]))
                            ]),
                            TableRow(children: [
                              const SizedBox.shrink(),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: RichText(
                                    text: const TextSpan(
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        children: [
                                      TextSpan(
                                        text: '*Additional charges may apply',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16),
                                      ),
                                    ])),
                              )
                            ]),
                          ],
                        ),
                      ),
                      const Text(
                          textAlign: TextAlign.justify,
                          style: descfont.nameOfTextStyle,
                          'Thrive Well is a Social Enterprise with a mission to expand trauma-informed community'
                          ' mental health services to individuals, communities and organisations, with a focus on'
                          'building community resilience in high-needs communities, in a sustainable manner.'
                          ' Clients with a monthly household income below a certain threshold will qualify for'
                          ' financial aid based on availability of program funding.'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  key: const Key('Container-MMHA'),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: const Color(0XffD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: const Color(0xff673FB4), width: 6)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(children: [
                          TextSpan(text: 'MMHA', style: header.nameOfTextStyle),
                          TextSpan(
                              text: '\nMalaysian Mental Health Association',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff333333)))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Table(
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(6),
                          },
                          children: [
                            TableRow(children: [
                              const Icon(
                                Icons.phone_forwarded_sharp,
                                size: 23,
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      children: [
                                    TextSpan(
                                        text: mmha,
                                        style: phonefont.nameOfTextStyle,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            UrlLauncher.launchUrl(_mmha);
                                            // await FlutterPhoneDirectCaller.callNumber(
                                            //     number);
                                          }),
                                  ]))
                            ]),
                            TableRow(children: [
                              const SizedBox.shrink(),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: RichText(
                                    text: const TextSpan(
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        children: [
                                      TextSpan(
                                        text: '*Additional charges may apply',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16),
                                      ),
                                    ])),
                              )
                            ]),
                          ],
                        ),
                      ),
                      const Text(
                          textAlign: TextAlign.justify,
                          style: descfont.nameOfTextStyle,
                          'Malaysian Mental Health Association provides support via their phone line'
                          ' on any mental health issues. MMHA also has qualified mental health professionals'
                          ' ie. clinical psychologist, and counselors providing psychological support services.'
                          ' Financial subsidies are readily available to ensure that necessary therapy and support'
                          ' is given to anyone who needs it.'),
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      );
}
