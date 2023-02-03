import 'package:flutter/material.dart';

import 'watchinfo_screen.dart';

class Psycho1 extends StatefulWidget {
  const Psycho1({super.key, required this.id});
  final String id;

  @override
  State<Psycho1> createState() => _Psycho1State();
}

class _Psycho1State extends State<Psycho1> {
  @override
  Widget build(BuildContext context) {
    var divHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: divHeight / 2 * 0.2,
          title: Container(
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.black)),
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              child:
                  Image.asset('images/logoappBar.png', fit: BoxFit.fitHeight)),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: WatchInfo(
          id: widget.id,
        ));
  }
}
