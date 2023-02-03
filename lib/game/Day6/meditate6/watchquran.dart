import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:async';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'dialog.dart';
import 'package:provider/provider.dart';
import 'package:test_firebaseauth/provider/status_provider.dart';
import 'package:test_firebaseauth/provider/isnotgreen_provider.dart';

class WatchQuran extends StatefulWidget {
  const WatchQuran({super.key});

  @override
  State<WatchQuran> createState() => _WatchQuranState();
}

class _WatchQuranState extends State<WatchQuran> {
  late YoutubePlayerController controller;
  late Duration _duration;
  late Duration _position;
  bool viddone = false;
  // bool _isEnd = false;
  // var uponend = '';

  @override
  void initState() {
    super.initState();

    const url = 'https://www.youtube.com/watch?v=NQ6hyyjlq7c';

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: true,
        hideThumbnail: true,
      ),
    )..addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    var divHeight = MediaQuery.of(context).size.height;
    var divWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
          onEnded: (duration) {
            setState(() {
              viddone = true;
            });
          },
        ),
        builder: (context, player) => Scaffold(
          backgroundColor: Colors.black.withOpacity(0.85),
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              player,
              // Text(controller.metadata.title),
              const SizedBox(
                height: 60,
              ),
              Visibility(
                visible: viddone,
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        setState(() {
                          controller.seekTo(const Duration(seconds: 0));
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Replay',
                            style: GoogleFonts.blinker(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.replay_rounded,
                            size: 26,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        setState(() {                                                      String uid = FirebaseAuth.instance.currentUser!.uid;

                          if (Provider.of<Status>(context, listen: false)
                                      .stat !=
                                  5 &&
                              Provider.of<IsNotGreen>(context, listen: false)
                                  .isnotgreen) {
                            context.read<Status>().chg('d6', 3,uid);
                            context.read<IsNotGreen>().chg(true);
                          }
                          Timer(
                              const Duration(milliseconds: 200),
                              () => showAnimatedDialog<void>(
                                  animationType: DialogTransitionType.fadeScale,
                                  barrierDismissible: true,
                                  duration: const Duration(milliseconds: 350),
                                  context: context,
                                  builder: (_) => const dialog()));
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        });
                      },
                      child: Text(
                        'Exit',
                        style: GoogleFonts.blinker(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
