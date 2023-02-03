import 'package:test_firebaseauth/first_time_user/dassresult.dart';
import 'package:flutter/material.dart';
// import 'main.dart';
import 'dart:math';
import 'package:webviewx/webviewx.dart';

enum Option { goBack, goForward, getTitle }

final Uri _url = Uri.parse(
    'https://www.ramlimusa.com/questionnaires/depression-anxiety-stress-scale-21-english/');

class DassWebView extends StatefulWidget {
  DassWebView({Key? key, required this.divHeight, required this.divWidth})
      : super(key: key);
  var divWidth;
  var divHeight;

  @override
  State<DassWebView> createState() => _DassWebViewState();
}

class _DassWebViewState extends State<DassWebView> {
  late WebViewXController webviewController;
  String innerTitle = 'Depression Anxiety Stress Scale 21';
  // String _selectedOp = ''; //cannot use webviewController.getTitle

  // Size get screenSize => MediaQuery.of(context).size;

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var divHeight = MediaQuery.of(context).size.height;
    // var divWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              // height: divHeight * 0.06,
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 19),
                    ),
                    onPressed: () {
                      dispose();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DassResultView()));
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(color: Colors.blue),
                    ),
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
                width: min(widget.divWidth * 1, 480),
                // width: double.maxFinite,
                height: widget.divHeight * 0.88,
                // height: double.maxFinite,
                initialContent:
                    'https://www.ramlimusa.com/questionnaires/depression-anxiety-stress-scale-21-english/',
                // 'https://www.youtube.com/watch?v=YMx8Bbev6T4',
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
