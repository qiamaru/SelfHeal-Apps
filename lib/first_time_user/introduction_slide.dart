import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionSlide extends StatefulWidget {
  const IntroductionSlide({super.key});

  @override
  State<IntroductionSlide> createState() => _IntroductionSlideState();
}

class _IntroductionSlideState extends State<IntroductionSlide> {
  @override
  Size get screenSize => MediaQuery.of(context).size;
  final pcontroller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    pcontroller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String imageUrl,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Image.asset(imageUrl,
                  fit: BoxFit.contain, width: double.infinity),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pcontroller,
        onPageChanged: ((index) {
          setState(() => isLastPage = index == 8);
        }),
        children: [
          buildPage(
            color: Colors.white70,
            imageUrl: 'images/logoappBar.png',
            title: 'Welcome to SelfHeal',
            subtitle: 'SelfHeal is a mobile app designed to '
                'help you take care of your mental health! Our app provides you with specific goals and activities to help you manage your mental health'
                ' conditions. By completing these activities, you\'ll be able to stay focused, productive, and motivated, and'
                ' feel more confident about your mental well-being.',
            // color: Colors.red,
          ),
          buildPage(
              color: Colors.white70,
              imageUrl: 'images/bdgeforintro.png',
              title: 'Engage in fun activities',
              subtitle:
                  'SelfHeal offers activities based on four different modules (Cognitive, Spiritual, Physical, and Psychological) '
                  'to be completed over a seven-day journey. Users receive badges for their achievements, which are displayed in the'
                  ' profile section. Once the journey is complete, users can choose to start again or take a break.'),
          buildPageBadge(
              color: Colors.white70,
              imageUrl: 'images/cognitiveintro.png',
              title: 'Cognitive',
              subtitle:
                  'Improve your brain fitness by playing brain-training games.'),
          buildPageBadge(
              color: Colors.white70,
              imageUrl: 'images/spiritual.png',
              title: 'Spiritual',
              subtitle:
                  'Stimulate your behaviour with spiritual or religious practice.'),
          buildPageBadge(
              color: Colors.white70,
              imageUrl: 'images/physical.png',
              title: 'Physical',
              subtitle:
                  'Take part in mini exercises of physical activities to stay fit.'),
          buildPageBadge(
              color: Colors.white70,
              imageUrl: 'images/psychointro.png',
              title: 'Psychological',
              subtitle:
                  'Try to learn on new things that could help empower yourself with new knowledge.'),
          buildPageColorCode(
              color: Colors.white70,
              imageUrl: 'images/colorcode.png',
              title: 'Track your progress',
              subtitle:
                  'In SelfHeal, you will complete activities on a daily basis, and the status of each activity will be indicated by a color code.'),
          buildPage(
              color: Colors.white70,
              imageUrl: 'images/isp.png',
              title: 'Inspired by',
              subtitle:
                  'The SelfHeal app was developed with the guidance of the IIUM Sejahtera Profiling: Self-Help Guide Book,'
                  ' published by CCSC IIUM. This e-book, which can be accessed through '
                  'the link in FAQ section, provided the inspiration for the app\'s four different categories of activities,'
                  ' which are designed to support users in their mental, physical, and spiritual well-being. The activities offered by the'
                  ' app provide a self-guided intervention for users as suggested by the e-book.'),
          buildPage(
              color: Colors.white70,
              imageUrl: 'images/lock.png',
              title: 'Data Privacy',
              subtitle:
                  'SelfHeal is committed to protecting the privacy of its users and adheres to the principles of the'
                  ' Personal Data Protection Act (PDPA) 2010. The SelfHeal Privacy Policy outlines the steps that are taken'
                  ' to ensure the security and integrity of user data.'),
        ],
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: Colors.teal.shade700,
                  minimumSize: const Size.fromHeight(80)),
              onPressed: () {
                bool donetuto = false;
                Navigator.pushReplacementNamed(
                  context,
                  '/hometuto',
                );
              },
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ))
          : Container(
              height: screenSize.height * 0.1,
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        pcontroller.jumpToPage(9);
                      },
                      icon: const Icon(Icons.skip_next_rounded),
                      label: const Text('SKIP')),
                  Center(
                      child: SmoothPageIndicator(
                    controller: pcontroller,
                    count: 9,
                    effect: SlideEffect(
                      spacing: 7,
                      dotColor: Colors.black26,
                      activeDotColor: Colors.teal.shade700,
                    ),
                    onDotClicked: (index) => pcontroller.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear),
                  )),
                  TextButton.icon(
                      onPressed: () {
                        pcontroller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                      icon: const Icon(Icons.navigate_next_rounded),
                      label: const Text('NEXT'))
                ],
              ),
            ),
    );
  }

  Widget buildPageBadge({
    required Color color,
    required String imageUrl,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Image.asset(imageUrl,
                  fit: BoxFit.contain, width: double.infinity),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 30.0, left: 30.0),
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );

  Widget buildPageColorCode({
    required Color color,
    required String imageUrl,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, bottom: 5, left: 30, right: 30),
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
                child: Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 65,
                      child: CircleAvatar(
                        radius: 63,
                        backgroundImage: AssetImage('images/codegrey.png'),
                        backgroundColor: Color(0xffFFD700),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Grey",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.0),
                              child: Text(
                                'Activity locked and inaccessible.',
                                style: TextStyle(fontSize: 17),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              //start meditate
              Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 65,
                      child: CircleAvatar(
                        radius: 63,
                        backgroundImage: AssetImage('images/codeyellow.png'),
                        backgroundColor: Color(0xffFFD700),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Yellow",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow.shade900),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.0),
                              child: Text(
                                'Current task to be completed',
                                style: TextStyle(fontSize: 17),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              //start Physics
              Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 65,
                      child: CircleAvatar(
                        radius: 63,
                        backgroundImage: AssetImage('images/codegreen.png'),
                        backgroundColor: Color(0xffFFD700),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Green",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade900),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.0),
                              child: Text(
                                'You have completed the task and can choose to repeat it to earn a badge.',
                                style: TextStyle(fontSize: 17),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
