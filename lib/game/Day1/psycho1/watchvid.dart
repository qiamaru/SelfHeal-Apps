import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_firebaseauth/provider/isnotgreen_provider.dart';
import 'package:test_firebaseauth/provider/status_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:async';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'dialog.dart';

class WatchVid extends StatefulWidget {
  const WatchVid({super.key, required this.vidData, required this.day});
  final dynamic vidData;
  final day;
  @override
  State<WatchVid> createState() => _WatchVidState();
}

class _WatchVidState extends State<WatchVid> {
  late YoutubePlayerController controller;
  late Duration _duration;
  late Duration _position;
  bool viddone = false;

  // bool _isEnd = false;
  // var uponend = '';

  @override
  void initState() {
    super.initState();

    var url = widget.vidData.url;

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
    return Container(
      child: SafeArea(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            // onReady: ,
            onEnded: (duration) {
              setState(() {
                // uponend = 'Dah Abis';
                // _chgtext(uponend);
                viddone = true;
                // Timer(
                //     const Duration(milliseconds: 200),
                //     () => showAnimatedDialog<void>(
                //         animationType: DialogTransitionType.fadeScale,
                //         barrierDismissible: true,
                //         duration: const Duration(milliseconds: 350),
                //         context: context,
                //         builder: (_) => const dialog()));
              });
            },
          ),
          builder: (context, player) => Scaffold(
            backgroundColor: Colors.black.withOpacity(0.9),
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
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
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
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
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.replay_rounded,
                              size: 26,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          setState(() {
                            switch (widget.day) {
                              case 'd1':
                                {
                                  String uid =
                                      FirebaseAuth.instance.currentUser!.uid;

                                  if (Provider.of<Status>(context,
                                                  listen: false)
                                              .stat !=
                                          5 &&
                                      Provider.of<IsNotGreen>(context,
                                              listen: false)
                                          .isnotgreen) {
                                    context.read<Status>().chg('d1', 5, uid);
                                    context.read<IsNotGreen>().chg(true);
                                  }
                                }
                                break;
                              case 'd2':
                                {
                                  String uid =
                                      FirebaseAuth.instance.currentUser!.uid;

                                  if (Provider.of<Status>(context,
                                                  listen: false)
                                              .stat2 !=
                                          5 &&
                                      Provider.of<IsNotGreen>(context,
                                              listen: false)
                                          .isnotgreen) {
                                    context.read<Status>().chg('d2', 5, uid);
                                    context.read<IsNotGreen>().chg(true);
                                  }
                                }
                                break;
                              case 'd3':
                                {
                                  String uid =
                                      FirebaseAuth.instance.currentUser!.uid;

                                  if (Provider.of<Status>(context,
                                                  listen: false)
                                              .stat3 !=
                                          5 &&
                                      Provider.of<IsNotGreen>(context,
                                              listen: false)
                                          .isnotgreen) {
                                    context.read<Status>().chg('d3', 5, uid);
                                    context.read<IsNotGreen>().chg(true);
                                  }
                                }
                                break;
                              case 'd4':
                                {
                                  String uid =
                                      FirebaseAuth.instance.currentUser!.uid;

                                  if (Provider.of<Status>(context,
                                                  listen: false)
                                              .stat4 !=
                                          5 &&
                                      Provider.of<IsNotGreen>(context,
                                              listen: false)
                                          .isnotgreen) {
                                    context.read<Status>().chg('d4', 5, uid);
                                    context.read<IsNotGreen>().chg(true);
                                  }
                                }
                                break;
                              case 'd5':
                                {
                                  String uid =
                                      FirebaseAuth.instance.currentUser!.uid;

                                  if (Provider.of<Status>(context,
                                                  listen: false)
                                              .stat5 !=
                                          5 &&
                                      Provider.of<IsNotGreen>(context,
                                              listen: false)
                                          .isnotgreen) {
                                    context.read<Status>().chg('d5', 5, uid);
                                    context.read<IsNotGreen>().chg(true);
                                  }
                                }
                                break;
                              case 'd6':
                                {
                                  String uid =
                                      FirebaseAuth.instance.currentUser!.uid;

                                  if (Provider.of<Status>(context,
                                                  listen: false)
                                              .stat6 !=
                                          5 &&
                                      Provider.of<IsNotGreen>(context,
                                              listen: false)
                                          .isnotgreen) {
                                    context.read<Status>().chg('d6', 5, uid);
                                    context.read<IsNotGreen>().chg(true);
                                  }
                                }
                                break;
                              case 'd7':
                                {
                                  String uid =
                                      FirebaseAuth.instance.currentUser!.uid;

                                  if (Provider.of<Status>(context,
                                                  listen: false)
                                              .stat7 !=
                                          5 &&
                                      Provider.of<IsNotGreen>(context,
                                              listen: false)
                                          .isnotgreen) {
                                    context.read<Status>().chg('d7', 5, uid);
                                    context.read<IsNotGreen>().chg(true);
                                  }
                                }
                                break;
                            }
                            Navigator.of(context).pop();
                            Timer(
                                const Duration(milliseconds: 200),
                                () => showAnimatedDialog<void>(
                                    animationType:
                                        DialogTransitionType.fadeScale,
                                    barrierDismissible: true,
                                    duration: const Duration(milliseconds: 350),
                                    context: context,
                                    builder: (_) => const dialog()));
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
                // Text('${controller.metadata.duration.inSeconds} seconds'),
                // Text('${controller.value.position.inSeconds} seconds'),
                // if (controller.value.position >= controller.metadata.duration)
                //   Container(
                //     height: 20,
                //     color: Colors.green,
                //   )
                // Container(
                //     color: Colors.amber,
                //     child: Text(
                //       uponend,
                //       style: TextStyle(color: Colors.black, fontSize: 30),
                //     )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
