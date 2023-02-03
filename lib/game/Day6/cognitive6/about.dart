import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:mirulhotline/game/Day1/meditate1/styles.dart';

class AlertTip extends StatelessWidget {
  const AlertTip({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // backgroundColor: Styles.secondaryBackgroundColor,
      title: Center(
        child: Text(
          'Tip',
          // style: TextStyle(color: Styles.foregroundColor),
        ),
      ),
      content: Text(
        'Press play once you are ready to solve the slide puzzle. You may set the difficulty accordingly using the slider.',
        textAlign: TextAlign.center,
      ),
    );
  }
}

class AlertAbout extends StatelessWidget {
  static const String authorURL = "https://gitlab.com/shidilateh1";
  static const String sourceURL =
      "https://gitlab.com/shidistudio/flutter-tutorial/-/blob/cde1955d26f5c948a935f227fcebfb1c555cb601/slidePuzzle.dart";
  // static const String licenseURL =
  //     "https://github.com/pblinux/maze/blob/master/LICENSE";

  const AlertAbout({Key? key}) : super(key: key);

  openURL(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // backgroundColor: Styles.secondaryBackgroundColor,
      title: Center(
        child: Text(
          'About',
          // style: TextStyle(color: Styles.foregroundColor),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/icon/icon_round.png',
              //     height: 48.0, width: 48.0, fit: BoxFit.contain),
              Text(
                'Slide Puzzle',
                style: TextStyle(
                    // color: Styles.foregroundColor,
                    fontFamily: 'roboto',
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Author: ',
                style: TextStyle(
                    // color: Styles.foregroundColor,
                    fontFamily: 'roboto',
                    fontSize: 15),
              ),
              InkWell(
                onTap: () => openURL(authorURL),
                child: Text(
                  'Shidi Lateh',
                  style: TextStyle(
                      // color: Styles.primaryColor,
                      fontFamily: 'roboto',
                      fontSize: 15),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '                ',
                style: TextStyle(
                    // color: Styles.foregroundColor,
                    fontFamily: 'roboto',
                    fontSize: 15),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => openURL(sourceURL),
                child: Text(
                  'Source Code',
                  style: TextStyle(
                      color: Colors.blue, fontFamily: 'roboto', fontSize: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
