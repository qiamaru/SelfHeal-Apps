// import 'package:flutter/material.dart';

// class ChangePwScreen extends StatefulWidget {
//   const ChangePwScreen({super.key});

//   @override
//   State<ChangePwScreen> createState() => _ChangePwScreenState();
// }

// class _ChangePwScreenState extends State<ChangePwScreen> {
//   TextEditingController oldpwcontroller = TextEditingController();
//   TextEditingController newpwcontroller = TextEditingController();
//   TextEditingController confirmnewpwcontroller = TextEditingController();
//   bool passwordvisible = false;
//   bool passwordvisible2 = false;

//   @override
//   void initState() {
//     super.initState();
//     oldpwcontroller.text = 'current pw from firebase' ?? '';
//     // passwordvisible = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     var divHeight = MediaQuery.of(context).size.height;
//     var divWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: const Color(0xff8AD16A),
//         appBar: AppBar(
//           title: const Text('Change Password'),
//           centerTitle: true,
//         ),
//         body: Container(
//             decoration: const BoxDecoration(
//                 color: Color(0xff031606),
//                 borderRadius: BorderRadius.all(Radius.circular(30))),
//             padding: const EdgeInsets.all(20),
//             margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: divHeight * .03),
//                 const Text(
//                   "Old Password",
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: divWidth * .02),
//                   child: TextField(
//                     controller: oldpwcontroller,
//                     // enabled: false,
//                     decoration: const InputDecoration(
//                         // isDense: true,
//                         // hintText: username,
//                         hintStyle: TextStyle(color: Colors.black, fontSize: 20),
//                         contentPadding: EdgeInsets.all(8),
//                         filled: true,
//                         fillColor: Colors.white),
//                   ),
//                 ),
//                 SizedBox(height: divHeight * .02),
//                 const Text(
//                   "New Password",
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: divWidth * .02),
//                   child: TextFormField(
//                     // obscureText: true,
//                     obscureText: !passwordvisible,
//                     enableSuggestions: false,
//                     autocorrect: false,
//                     controller: newpwcontroller,
//                     // enabled: false,
//                     decoration: InputDecoration(
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             // Based on passwordVisible state choose the icon
//                             passwordvisible
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                             color: Theme.of(context).primaryColorDark,
//                           ),
//                           onPressed: () {
//                             // Update the state i.e. toogle the state of passwordVisible variable
//                             setState(() {
//                               passwordvisible = !passwordvisible;
//                             });
//                           },
//                         ),
//                         // isDense: true,
//                         // hintText: email,
//                         hintStyle:
//                             const TextStyle(color: Colors.black, fontSize: 20),
//                         contentPadding: const EdgeInsets.all(8),
//                         filled: true,
//                         fillColor: Colors.white),
//                   ),
//                 ),
//                 SizedBox(height: divHeight * .03),
//                 const Text(
//                   "Confirm New Password",
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: divWidth * .02),
//                   child: TextFormField(
//                     controller: confirmnewpwcontroller,
//                     obscureText: !passwordvisible2,
//                     enableSuggestions: false,
//                     autocorrect: false,
//                     // enabled: false,
//                     decoration: InputDecoration(
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             // Based on passwordVisible state choose the icon
//                             passwordvisible2
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                             color: Theme.of(context).primaryColorDark,
//                           ),
//                           onPressed: () {
//                             // Update the state i.e. toogle the state of passwordVisible variable
//                             setState(() {
//                               passwordvisible2 = !passwordvisible2;
//                             });
//                           },
//                         ),
//                         // isDense: true,
//                         // hintText: email,
//                         hintStyle:
//                             const TextStyle(color: Colors.black, fontSize: 20),
//                         contentPadding: const EdgeInsets.all(8),
//                         filled: true,
//                         fillColor: Colors.white),
//                   ),
//                 ),
//                 SizedBox(height: divHeight * .03),
//                 Center(
//                   child: ElevatedButton(
//                       onPressed: () {},
//                       style: ButtonStyle(
//                           shape:
//                               MaterialStateProperty.all<RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(18))),
//                           padding: MaterialStateProperty.all(
//                               const EdgeInsets.fromLTRB(22, 8, 22, 8)),
//                           backgroundColor: MaterialStateProperty.all(
//                               const Color(0xffD9D9D9))),
//                       child: const Text(
//                         'SUBMIT',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Color.fromARGB(255, 6, 92, 162)),
//                       )),
//                 )
//               ],
//             )));
//   }
// }
