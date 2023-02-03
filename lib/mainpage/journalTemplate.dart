// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:keyboard_dismisser/keyboard_dismisser.dart';

// var now = new DateTime.now();
// var nowt = new DateTime.now();

// var formatter = new DateFormat('dd MMM yyyy');
// String formattedDate = formatter.format(now);
// var formattert = new DateFormat('jm');
// String formattedTime = formattert.format(nowt);

// class dflt {
//   static const TextStyle nameOfTextStyle = TextStyle(
//       fontSize: 20,
//       color: Color(0xff404040),
//       fontWeight: FontWeight.bold,
//       fontStyle: FontStyle.italic);
// }

// class JournalTemplate extends StatefulWidget {
//   const JournalTemplate({super.key});

//   @override
//   State<JournalTemplate> createState() => _JournalTemplateState();
// }

// class _JournalTemplateState extends State<JournalTemplate> {
//   Size get screenSize => MediaQuery.of(context).size;
//   final jcontroller = TextEditingController();
//   double emotesz = 48;

//   @override
//   Widget build(BuildContext context) => KeyboardDismisser(
//         gestures: [GestureType.onTap],
//         child: Scaffold(
//           // resizeToAvoidBottomPadding: false,
//           resizeToAvoidBottomInset: false,
//           backgroundColor: Color(0xff8AD16A),
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             // crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: Text(
//                   'Journal',
//                   // textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontSize: 35,
//                       color: Color(0xff333333),
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: Container(
//                   // padding: EdgeInsets.all(15),
//                   height: screenSize.height * .63,
//                   decoration: BoxDecoration(
//                       color: Color(0XffD9D9D9),
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(color: Colors.black, width: 3)),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Column(children: [
//                       SizedBox(
//                         height: 25,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Date: $formattedDate',
//                               style: dflt.nameOfTextStyle),
//                           Text(formattedTime, style: dflt.nameOfTextStyle),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       TextField(
//                         controller: jcontroller,
//                         autofocus: true,
//                         style: TextStyle(fontSize: 20),
//                         textAlign: TextAlign.justify,
//                         textCapitalization: TextCapitalization.sentences,
//                         keyboardType: TextInputType.multiline,
//                         minLines: 1, //Normal textInputField will be displayed
//                         maxLines: 9, // whe
//                         decoration: InputDecoration(
//                           suffixIcon: IconButton(
//                             icon: Icon(Icons.close),
//                             onPressed: (() => jcontroller.clear()),
//                           ),
//                           hintText:
//                               'Write anything about your self-healing journey or just anything..\n\n\n\n\n\n\n',
//                           hintStyle: TextStyle(
//                               color: Color(0XffD9D9D9),
//                               fontWeight: FontWeight.w500),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: BorderSide(
//                                   width: 0, style: BorderStyle.none)),
//                           filled: true,
//                           fillColor: Color(0xffFFFFFF),
//                         ),
//                         textInputAction: TextInputAction.done,
//                       ),
//                       Center(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 14.0),
//                           child: Text(
//                             'Describe your day using emoji',
//                             style: dflt.nameOfTextStyle,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Color(0xffD1EBD5),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         width: double.infinity,
//                         height: 70,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             IconButton(
//                               // color: Colors.amber,
//                               iconSize: emotesz,
//                               onPressed: (() {
//                                 setState(() {});
//                               }),
//                               icon: Image.asset(
//                                 'images/sadworsen.png',
//                                 opacity: const AlwaysStoppedAnimation(.5),
//                               ),
//                               // Icon(Icons.emoji_emotions_outlined)
//                             ),
//                             IconButton(
//                               iconSize: emotesz,
//                               onPressed: (() {}),
//                               icon: Image.asset(
//                                 'images/sad.png',
//                               ),
//                             ),
//                             IconButton(
//                               iconSize: emotesz,
//                               onPressed: (() {}),
//                               icon: Image.asset(
//                                 'images/neutral.png',
//                               ),
//                             ),
//                             IconButton(
//                               iconSize: emotesz,
//                               onPressed: (() {}),
//                               icon: Image.asset(
//                                 'images/happy.png',
//                               ),
//                             ),
//                             IconButton(
//                               iconSize: emotesz,
//                               onPressed: (() {}),
//                               icon: Image.asset(
//                                 'images/happygila.png',
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {},
//                         child: Text(
//                           'Add journal',
//                           style: TextStyle(color: Colors.black, fontSize: 18),
//                         ),
//                         style: ButtonStyle(
//                             backgroundColor:
//                                 MaterialStateProperty.all(Colors.white),
//                             shape: MaterialStateProperty.all(
//                                 RoundedRectangleBorder(
//                                     borderRadius:
//                                         BorderRadius.circular(10.0)))),
//                       )
//                     ]),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       );
// }
