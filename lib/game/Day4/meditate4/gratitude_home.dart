import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'dialog.dart';

class GratitudeScreen extends StatefulWidget {
  const GratitudeScreen({super.key});

  @override
  State<GratitudeScreen> createState() => _GratitudeScreenState();
}

class _GratitudeScreenState extends State<GratitudeScreen> {
  late TextEditingController _controller;
  int countlist = 0;
  bool fbvisible = false;
  SharedPreferences? sharedPrefs;

  late List<String> gratList = [];

  addtosp(List<String> list) {
    sharedPrefs?.setStringList('spfor', list);
    // sharedPrefs?.setInt('cl', countlist);
    // sharedPrefs?.setBool('fbv', true);
    // print(sharedPrefs?.getStringList('spfor'));
  }

  addtofbv() {
    setState(() {
      sharedPrefs?.setBool('fbv', true);
    });
  }

  Future<void> fetchList() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    setState(() {
      gratList = sharedPrefs.getStringList("spfor") ?? [];
      // countlist = sharedPrefs.getInt("cl") ?? 0;
      fbvisible = sharedPrefs.getBool('fbv') ?? false;
    });
  }

  Future<void> removeList() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    setState(() {
      sharedPrefs.remove('spfor');
      sharedPrefs.remove('cl');
      sharedPrefs.remove('fbv');
    });
  }

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      setState(() => sharedPrefs = prefs);
    });
    // removeList(); //if wanna empty on start enable this
    fetchList();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var divHeight = MediaQuery.of(context).size.height;
    var divWidth = MediaQuery.of(context).size.width;
    return KeyboardDismisser(
      gestures: [GestureType.onTap],
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(65),
            child: AppBar(
              backgroundColor: Color(0xff8AD16A),
              toolbarHeight: divHeight,
              title: Container(
                width: divWidth * .45,
                decoration: BoxDecoration(
                  color: Color(0XffD9D9D9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Image.asset('images/meditate.png',
                            fit: BoxFit.fitHeight)),
                    const Flexible(
                        flex: 3,
                        child: Text(
                          'Spiritual',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ))
                  ],
                ),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            )),
        floatingActionButton: Visibility(
          visible: fbvisible,
          child: FloatingActionButton(
            onPressed: (() {
              Navigator.of(context).pop();
              // Navigator.of(context).pop();
            }),
            tooltip: 'Done',
            child: Icon(Icons.done_outline_sharp),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    'Gratitude List',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff333333),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(children: [
                      TextSpan(
                          text:
                              'Can you list out 5 or more things that you are grateful for?',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      TextSpan(
                          text: " Let's do it together. ",
                          style: TextStyle(color: Colors.blue, fontSize: 18))
                    ])),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    color: Colors.green[200],
                    child: const Text(
                      "I am grateful for ...",
                      style:
                          TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            // color: Colors.amber,
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, left: 15),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Write your gratitude here ...',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 148, 148, 148),
                                    fontWeight: FontWeight.w500),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                              style: TextStyle(fontSize: 18),
                              minLines: 1,
                              maxLines: 3,
                              controller: _controller,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            // color: Colors.amberAccent,
                            child: IconButton(
                                alignment: Alignment.center,
                                onPressed: () {
                                  setState(() {
                                    countlist++;
                                    print(countlist);
                                    gratList.add(_controller.text);
                                    // print(gratList);
                                    addtosp(gratList);
                                    _controller.text = '';
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    if (countlist == 5) {
                                      fbvisible = true;
                                      addtofbv();
                                      Timer(
                                          const Duration(milliseconds: 200),
                                          () => showAnimatedDialog<void>(
                                              animationType:
                                                  DialogTransitionType
                                                      .fadeScale,
                                              barrierDismissible: true,
                                              duration: const Duration(
                                                  milliseconds: 350),
                                              context: context,
                                              builder: (_) => const dialog()));
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.post_add_rounded,
                                  size: 32,
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: gratList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        // minVerticalPadding: null,
                        title: Container(
                          color: Colors.greenAccent,
                          padding: EdgeInsets.all(20),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: '${index + 1}.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                // text: " ${gratList[index]}",
                                text: '${gratList[index]}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20))
                          ])),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
