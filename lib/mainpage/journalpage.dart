// import 'package:flutter/material.dart';
// import 'package:test_firebaseauth/mainpage/journalTemplate.dart';

// class Journal extends StatefulWidget {
//   const Journal({Key? key}) : super(key: key);

//   @override
//   State<Journal> createState() => _JournalState();
// }

// class _JournalState extends State<Journal> {
//   Size get screenSize => MediaQuery.of(context).size;
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         backgroundColor: Color(0xff8AD16A),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: Text(
//                 'Journal',
//                 style: TextStyle(
//                     fontSize: 35,
//                     color: Color(0xff333333),
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Expanded(
//                 child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               children: <Widget>[
//                 Container(
//                   padding: EdgeInsets.all(15),
//                   height: screenSize.height * .63,
//                   decoration: BoxDecoration(
//                       color: Color(0XffD9D9D9),
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(color: Colors.black, width: 3)),
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         IconButton(
//                           onPressed: (() {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         const JournalTemplate()));
//                           }),
//                           icon: Icon(
//                             Icons.add_circle_sharp,
//                             color: Color(0xff4CD864),
//                             size: 64,
//                           ),
//                           padding: EdgeInsets.all(0),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                       ]),
//                 )
//               ],
//             ))
//           ],
//         ),
//       );
// }
