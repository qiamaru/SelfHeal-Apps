import 'dassresult.dart';
import 'package:flutter/material.dart';
// import 'main.dart';
import 'dart:math';
import 'package:webviewx/webviewx.dart';

enum Option { goBack, goForward, getTitle }

final Uri _url = Uri.parse(
    'https://www.ramlimusa.com/questionnaires/depression-anxiety-stress-scale-21-english/');

class urltest extends StatefulWidget {
  urltest({Key? key}) : super(key: key);

  @override
  State<urltest> createState() => _urltestState();
}

class _urltestState extends State<urltest> {
  late WebViewXController webviewController;
  String innerTitle = 'Depression Anxiety Stress Scale 21';
  // String _selectedOp = ''; //cannot use webviewController.getTitle

  Size get screenSize => MediaQuery.of(context).size;

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: screenSize.height * 0.06,
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DassView()));
                    },
                    icon: Icon(Icons.clear_rounded),
                    splashRadius: 15,
                  ),
                  Text(innerTitle),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.more_horiz),
                  //   splashRadius: 15,
                  // ),
                  PopupMenuButton(
                      onSelected: (value) {
                        setState(() {
                          if (value == Option.goBack) {
                            // _selectedOp = 'Back';
                            webviewController.goBack();
                          } else if (value == Option.goForward) {
                            // _selectedOp = 'Forward';
                            webviewController.goForward();
                          }
                          // else if (value == Option.getTitle) {
                          //   _selectedOp =
                          //       webviewController.getTitle().toString();
                          // }
                        });
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                            const PopupMenuItem(
                                value: Option.goBack, child: Text('Go Back')),
                            const PopupMenuItem(
                                value: Option.goForward,
                                child: Text('Go Forward')),
                            // const PopupMenuItem(
                            //     value: Option.getTitle,
                            //     child: Text('Get Title')),
                          ]),
                  // Text(_selectedOp),
                ],
              ),
            ),
            SizedBox(
              child: WebViewX(
                // if(MediaQuery.of(context).orientation==Orientation.portrait){
                //   width: ,
                // }
                width: min(screenSize.width * 1, 480),
                // width: double.maxFinite,
                height: screenSize.height * 0.88,
                // height: double.maxFinite,
                initialContent:
                    // 'https://www.ramlimusa.com/questionnaires/depression-anxiety-stress-scale-21-english/',
                    'https://www.youtube.com/watch?v=YMx8Bbev6T4',
                initialSourceType: SourceType.url,
                onWebViewCreated: (controller) =>
                    webviewController = controller,
                // onPageStarted: _getTitle(innerTitle),
              ),
            ),
          ],
        ),
      )),
    );
  }

  // _getTitle(String innerTitle) {
  //   webviewController.getTitle();
  //   setState(() {
  //     // innerTitle = webviewController.getTitle().toString();
  //   });
  // }
}
