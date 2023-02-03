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
        'Press Play when you are ready to solve the puzzle. Have fun!',
        textAlign: TextAlign.center,
      ),
    );
  }
}

class AlertAbout extends StatelessWidget {
  static const String authorURL =
      "https://pub.dev/publishers/ocompilador.blog/packages";
  static const String sourceURL =
      "https://github.com/edunuzzi/flutter_jigsaw_puzzle";
  static const String licenseURL =
      "https://pub.dev/packages/flutter_jigsaw_puzzle/license";

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
                'Flutter Jigsaw Puzzle 0.1.0',
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
                  'ocompilador.blog',
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
              Text(
                'License: ',
                style: TextStyle(
                    // color: Styles.foregroundColor,
                    fontFamily: 'roboto',
                    fontSize: 15),
              ),
              InkWell(
                onTap: () => openURL(licenseURL),
                child: Text(
                  'MIT License',
                  style: TextStyle(
                      // color: Styles.primaryColor,
                      fontFamily: 'roboto',
                      fontSize: 15),
                ),
              ),
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
