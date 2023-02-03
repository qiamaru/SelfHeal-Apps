import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_firebaseauth/game/Day1/psycho1/vid_link_list.dart';
import 'package:test_firebaseauth/game/Day1/psycho1/watchvid.dart';

class WatchInfo extends StatefulWidget {
  const WatchInfo({super.key, required this.id});
  final String id;

  @override
  State<WatchInfo> createState() => _WatchInfoState();
}

class _WatchInfoState extends State<WatchInfo> {
  late var vidData;

  @override
  void didChangeDependencies() {
    vidData = VidLink_LIST.where((element) {
      return element.id.contains(widget.id);
    }).toList().first;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // workoutExercises = List.from(displayedExercises);
    var divHeight = MediaQuery.of(context).size.height;
    var divWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 203, 254, 161),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(65),
            child: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: const Color(0xff8AD16A),
              toolbarHeight: divHeight,
              title: Container(
                width: divWidth * .47,
                decoration: BoxDecoration(
                  color: const Color(0XffD9D9D9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Image.asset('images/psycho.png',
                            fit: BoxFit.fitHeight)),
                    const Flexible(
                        flex: 3,
                        child: Text(
                          'Psychology',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ))
                  ],
                ),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            )),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Let\'s Try\nNew Thing',
            textAlign: TextAlign.center,
            style: GoogleFonts.dancingScript(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 65,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(
              color: Colors.black,
              thickness: 2,
              height: 2,
              endIndent: MediaQuery.of(context).size.width * 0.1,
              indent: MediaQuery.of(context).size.width * 0.1,
            ),
          ),
          Text(
            vidData.title,
            // textAlign: TextAlign.center,
            style: GoogleFonts.rowdies(
              textStyle: const TextStyle(
                color: Colors.black87,
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(
              color: Colors.black,
              thickness: 2,
              height: 2,
              endIndent: MediaQuery.of(context).size.width * 0.1,
              indent: MediaQuery.of(context).size.width * 0.1,
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: ElevatedButton(
                onPressed: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => WatchVid(
                                vidData: vidData,
                                day: widget.id,
                              ))));
                }),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Watch Video',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            // letterSpacing: 1,
                            fontSize: 26,
                            color: Colors.white),
                      )),
                ),
              ))
        ])));
  }
}
