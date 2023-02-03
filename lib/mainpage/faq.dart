import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:url_launcher/url_launcher_string.dart';

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(children: [
                TextSpan(
                  text: 'FAQ',
                  style: TextStyle(
                      fontSize: 35,
                      color: Color(0xff333333),
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: '\nFrequently Asked Questions',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff333333)))
              ]),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const GFAccordion(
                  contentPadding: EdgeInsets.all(15),
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  margin: EdgeInsets.all(13),
                  collapsedTitleBackgroundColor: Color(0xffAFD69B),
                  expandedTitleBackgroundColor: Color(0xffB7CC9D),
                  titlePadding: EdgeInsets.all(15),
                  collapsedIcon: Icon(Icons.add),
                  expandedIcon: Icon(Icons.minimize),
                  title:
                      'Can you provide a brief overview or description of the SelfHeal app?',
                  contentChild: Text(
                    'SelfHeal app is an app which provide comprenhensive module of activities to '
                    'be done by user in effort to combat against mental health issues.  In the context of mental health, self-healing refers to the process of an individual taking steps to improve their mental well-being and cope with challenges or difficulties on their own, without relying on outside help or intervention. Hence, this app is looking for to realize this objective for people who are struggling with mental health issues.',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const GFAccordion(
                  contentPadding: EdgeInsets.all(15),
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  margin: EdgeInsets.all(13),
                  collapsedTitleBackgroundColor: Color(0xffAFD69B),
                  expandedTitleBackgroundColor: Color(0xffB7CC9D),
                  titlePadding: EdgeInsets.all(15),
                  collapsedIcon: Icon(Icons.add),
                  expandedIcon: Icon(Icons.minimize),
                  title:
                      'How does SelfHeal help to distract from negative thoughts?',
                  contentChild: Text(
                    'The SelfHeal app provides users with daily activities to complete. '
                    'These activities can vary from day to day, and users can earn badges for completing them. '
                    'These badges can be viewed in the user\'s profile and serve as a way to track achievements '
                    'and provide a sense of satisfaction. The activities provided by the app are divided into '
                    'four categories: Cognitive, Spiritual, Physical, and Psychological. These activities are'
                    ' designed to help users stay motivated and fill their time during quarantine or while they are working on self-healing.',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const GFAccordion(
                  contentPadding: EdgeInsets.all(15),
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  margin: EdgeInsets.all(13),
                  collapsedTitleBackgroundColor: Color(0xffAFD69B),
                  expandedTitleBackgroundColor: Color(0xffB7CC9D),
                  titlePadding: EdgeInsets.all(15),
                  collapsedIcon: Icon(Icons.add),
                  expandedIcon: Icon(Icons.minimize),
                  title: 'Who is SelfHeal app for?',
                  contentChild: Text(
                    'The SelfHeal app is intended to be used by individuals who are required to undergo self-quarantine'
                    ' due to COVID-19 infection and those who are going through stressful events such as grieving or any equivalent occurrence.',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
                GFAccordion(
                  contentPadding: const EdgeInsets.all(15),
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  margin: const EdgeInsets.all(13),
                  collapsedTitleBackgroundColor: const Color(0xffAFD69B),
                  expandedTitleBackgroundColor: const Color(0xffB7CC9D),
                  titlePadding: const EdgeInsets.all(15),
                  collapsedIcon: const Icon(Icons.add),
                  expandedIcon: const Icon(Icons.minimize),
                  title: 'What inspired the development of the SelfHeal app?',
                  contentChild: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(children: [
                      const TextSpan(
                          text:
                              'The SelfHeal app was inspired by the e-book entitled IIUM Sejahtera Profiling:'
                              ' Self-Help Guide Book published by the Counseling & Career Services Centre (CCSC) IIUM.'
                              ' This e-book can be accessed through',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      TextSpan(
                          text: ' IIUM Sejahtera Profiling Website.',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launchUrlString('https://anyflip.com/cpxxk/slpg/',
                                  mode: LaunchMode.externalApplication);
                            },
                          style:
                              const TextStyle(fontSize: 18, color: Colors.blue))
                    ]),
                  ),
                ),
                const GFAccordion(
                  contentPadding: EdgeInsets.all(15),
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  margin: EdgeInsets.all(13),
                  collapsedTitleBackgroundColor: Color(0xffAFD69B),
                  expandedTitleBackgroundColor: Color(0xffB7CC9D),
                  titlePadding: EdgeInsets.all(15),
                  collapsedIcon: Icon(Icons.add),
                  expandedIcon: Icon(Icons.minimize),
                  title:
                      'Can you provide more information about the data that is collected by the SelfHeal app, how it is used, and how it is stored?',
                  contentChild: Text(
                    'SelfHeal app mostly stored user details such as username, password, email, achievements '
                    'and also the user progress on the day-to-day activities locally in user local device. '
                    'There is no personal information that will be kept within the SelfHeal app rather than '
                    'the relevant data that are needed for the app to run. The data stored will then be synchronize'
                    ' with the cloud database to ensure the data security and integrity and for convenience method '
                    'to retrieve the data in case of user log onto another device.',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const GFAccordion(
                  contentPadding: EdgeInsets.all(15),
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  margin: EdgeInsets.all(13),
                  collapsedTitleBackgroundColor: Color(0xffAFD69B),
                  expandedTitleBackgroundColor: Color(0xffB7CC9D),
                  titlePadding: EdgeInsets.all(15),
                  collapsedIcon: Icon(Icons.add),
                  expandedIcon: Icon(Icons.minimize),
                  title:
                      'Is it possible for users to delete their SelfHeal account, and if so, how does the process work?',
                  contentChild: Text(
                    'Yes, users can delete their SelfHeal account by accessing the settings section located in '
                    'the profile features. When a user confirms that they want to delete their account, all of their'
                    ' data will be erased from both the local device and the cloud database (Firebase).',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
