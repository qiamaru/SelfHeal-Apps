import 'package:firebase_auth/firebase_auth.dart'
    hide PhoneAuthProvider, EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:test_firebaseauth/firebase_options.dart';
import 'package:test_firebaseauth/first_time_user/welcome.dart';
import 'package:test_firebaseauth/mainpage/faq.dart';
import 'package:test_firebaseauth/provider/confirm_provider.dart';
import 'package:test_firebaseauth/provider/currentpage_provider.dart';
import 'package:test_firebaseauth/provider/hvpressstart.dart';
import 'package:test_firebaseauth/provider/isnotgreen_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';
import 'package:test_firebaseauth/mainpage/hotlinepage.dart';
import 'package:test_firebaseauth/mainpage/homepage.dart';
import 'package:provider/provider.dart';
import 'package:test_firebaseauth/provider/status_provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_firebaseauth/resetPass/reset_password_screen.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:test_firebaseauth/retrieve_database.dart';

// import 'config.dart';
import 'decorations.dart';
import 'profilepage.dart';

void main() async {
  // ignore: constant_identifier_names
  const google_client_id =
      '807430412014-7411i2n5cbf57nr5gbf7cf6tnfapl482.apps.googleusercontent.com';
  await GetStorage.init(); //if chg, along w async
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    GoogleProvider(clientId: google_client_id),
  ]);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Status()),
    ChangeNotifierProvider(create: (_) => IsNotGreen()),
    ChangeNotifierProvider(create: (_) => CurrentPage()),
    ChangeNotifierProvider(create: (_) => HvPressStart()),
    ChangeNotifierProvider(create: (_) => isConfirm()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.standard,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle),
        textButtonTheme: TextButtonThemeData(style: buttonStyle),
        outlinedButtonTheme: OutlinedButtonThemeData(style: buttonStyle),
        backgroundColor: Colors.white,
        // primarySwatch: Colors.blue,
        primarySwatch: Colors.green, //myp
      ),
      initialRoute: '/',
      // initialRoute,
      routes: {
        '/': (context) {
          return const SplashScreen();
        },
        '/home': (context) {
          return ShowCaseWidget(
              builder: Builder(
                  builder: (_) => Main(
                        donetuto: true,
                      )));
        },
        '/hometuto': (context) {
          return ShowCaseWidget(
              builder: Builder(
                  builder: (_) => Main(
                        donetuto: false,
                      )));
        },
        '/firsttime': (context) {
          return const WelcomeView();
        },
        '/auth': (context) {
          return DoubleBack(
            message: "Press back again to exit",
            child: SignInScreen(
              actions: [
                ForgotPasswordAction((context, email) {
                  Navigator.pushNamed(
                    context,
                    '/forgot-password',
                    arguments: {'email': email},
                  );
                }),
                // VerifyPhoneAction((context, _) {
                //   Navigator.pushNamed(context, '/phone');
                // }),
                AuthStateChangeAction<SignedIn>((context, state) async {
                  final String userUID = FirebaseAuth.instance.currentUser!.uid;
                  bool checkdatabase = false;
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  DatabaseReference readref =
                      FirebaseDatabase.instance.ref('users/$userUID');
                  final snapshot = await readref.get();
                  checkdatabase = snapshot.exists;
                  // readref.onValue.listen((DatabaseEvent event) {
                  //   checkdatabase = event.snapshot.exists;
                  //   print('${checkdatabase}lmaoayam');
                  // });
                  bool checkValue = prefs.containsKey('donefirsttime$userUID');
                  print('checkvalue:$checkValue');

                  if (checkValue || checkdatabase) {
                    if (checkdatabase) {
                      final bool siap = await retrieveDatabase();
                      if (siap) {
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    }
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    Navigator.pushReplacementNamed(context, '/firsttime');
                  }
                }),
                AuthStateChangeAction<UserCreated>((context, state) {
                  // if (!state.credential.user!.emailVerified) {
                  //   Navigator.pushNamed(context, '/verify-email');
                  // } else {
                  Navigator.pushReplacementNamed(context, '/firsttime');
                  // }
                }),
                // AuthStateChangeAction<CredentialLinked>((context, state) {
                //   // if (!state.user.emailVerified) {
                //   //   Navigator.pushNamed(context, '/verify-email');
                //   // } else {
                //   Navigator.pushReplacementNamed(context, '/firsttime');
                //   // }
                // }),
                // mfaAction,
                // EmailLinkSignInAction((context) {
                //   Navigator.pushReplacementNamed(context, '/email-link-sign-in');
                // }),
              ],
              styles: const {
                EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
              },
              headerBuilder: headerImage('images/logoappBar.png'),
              sideBuilder: sideImage('assets/google.png'),
              subtitleBuilder: (context, action) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    action == AuthAction.signIn
                        ? 'Welcome to SelfHeal! Please sign in to continue.'
                        : 'Welcome to SelfHeal! Please create an account to continue',
                  ),
                );
              },
              // footerBuilder: (context, action) {
              //   return Center(
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 16),
              //       child: Text(
              //         action == AuthAction.signIn
              //             ? 'By signing in, you agree to our terms and conditions.'
              //             : 'By registering, you agree to our terms and conditions.',
              //         style: const TextStyle(color: Colors.grey),
              //       ),
              //     ),
              //   );
              // },
            ),
          );
        },
        // '/verify-email': (context) {
        //   return EmailVerificationScreen(
        //     headerBuilder: headerIcon(Icons.verified),
        //     sideBuilder: sideIcon(Icons.verified),
        //     actionCodeSettings: actionCodeSettings,
        //     actions: [
        //       EmailVerifiedAction(() {
        //         Navigator.pushReplacementNamed(context, '/profile');
        //       }),
        //       AuthCancelledAction((context) {
        //         FirebaseUIAuth.signOut(context: context);
        //         Navigator.pushReplacementNamed(context, '/');
        //       }),
        //     ],
        //   );
        // },
        // '/phone': (context) {
        //   return PhoneInputScreen(
        //     actions: [
        //       SMSCodeRequestedAction((context, action, flowKey, phone) {
        //         Navigator.of(context).pushReplacementNamed(
        //           '/sms',
        //           arguments: {
        //             'action': action,
        //             'flowKey': flowKey,
        //             'phone': phone,
        //           },
        //         );
        //       }),
        //     ],
        //     headerBuilder: headerIcon(Icons.phone),
        //     sideBuilder: sideIcon(Icons.phone),
        //   );
        // },
        // '/sms': (context) {
        //   final arguments = ModalRoute.of(context)?.settings.arguments
        //       as Map<String, dynamic>?;

        //   return SMSCodeInputScreen(
        //     actions: [
        //       AuthStateChangeAction<SignedIn>((context, state) {
        //         Navigator.of(context).pushReplacementNamed('/profile');
        //       })
        //     ],
        //     flowKey: arguments?['flowKey'],
        //     action: arguments?['action'],
        //     headerBuilder: headerIcon(Icons.sms_outlined),
        //     sideBuilder: sideIcon(Icons.sms_outlined),
        //   );
        // },
        '/forgot-password': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>?;

          return ForgotPasswordScreen(
            email: arguments?['email'],
            headerMaxExtent: 200,
            headerBuilder: headerIcon(Icons.lock),
            sideBuilder: sideIcon(Icons.lock),
          );
        },
        '/reset-password': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>?;

          return ResetPasswordScreen(
            email: arguments?['email'],
            headerMaxExtent: 200,
            headerBuilder: headerIcon(Icons.lock_reset),
            sideBuilder: sideIcon(Icons.lock_reset),
          );
        },
        // '/email-link-sign-in': (context) {
        //   return EmailLinkSignInScreen(
        //     actions: [
        //       AuthStateChangeAction<SignedIn>((context, state) {
        //         Navigator.pushReplacementNamed(context, '/');
        //       }),
        //     ],
        //     provider: emailLinkProviderConfig,
        //     headerMaxExtent: 200,
        //     headerBuilder: headerIcon(Icons.link),
        //     sideBuilder: sideIcon(Icons.link),
        //   );
        // },
        '/profile': (context) {
          return ProfileScreen(
            appBar: AppBar(title: const Text('Profile')),
            actions: [
              SignedOutAction((context) {
                Navigator.pushReplacementNamed(context, '/auth');
              }),
              // ForgotPasswordAction((context, email) {
              //   Navigator.pushNamed(
              //     context,
              //     '/forgot-password',
              //     arguments: {'email': email},
              //   );
              // }),
              // mfaAction,
            ],
            //actionCodeSettings: actionCodeSettings,
            // showMFATile: false,
          );
        },
      },
      // home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) => AnimatedSplashScreen(
        splash: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'images/splash.png',
                width: 150,
                height: 150,
              ),
            ),
            const Text(
              'SelfHeal',
              style: TextStyle(
                  fontFamily: 'TenorSans',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 49, 77, 116)),
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 203, 254, 161),
        nextScreen: FirebaseAuth.instance.currentUser == null
            ? DoubleBack(
                message: "Press back again to exit",
                child: SignInScreen(
                  actions: [
                    ForgotPasswordAction((context, email) {
                      Navigator.pushNamed(
                        context,
                        '/forgot-password',
                        arguments: {'email': email},
                      );
                    }),
                    // VerifyPhoneAction((context, _) {
                    //   Navigator.pushNamed(context, '/phone');
                    // }),
                    AuthStateChangeAction<SignedIn>((context, state) async {
                      final String userUID =
                          FirebaseAuth.instance.currentUser!.uid;
                      bool checkdatabase = false;
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      DatabaseReference readref =
                          FirebaseDatabase.instance.ref('users/$userUID');
                      final snapshot = await readref.get();
                      checkdatabase = snapshot.exists;
                      // readref.onValue.listen((DatabaseEvent event) {
                      //   checkdatabase = event.snapshot.exists;
                      //   print('${checkdatabase}lmaoayam');
                      // });
                      bool checkValue =
                          prefs.containsKey('donefirsttime$userUID');

                      if (checkValue || checkdatabase) {
                        if (checkdatabase) {
                          final bool siap = await retrieveDatabase();
                          if (siap) {
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        }
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        Navigator.pushReplacementNamed(context, '/firsttime');
                      }
                    }),
                    AuthStateChangeAction<UserCreated>((context, state) {
                      // if (!state.credential.user!.emailVerified) {
                      //   Navigator.pushNamed(context, '/verify-email');
                      // } else {
                      Navigator.pushReplacementNamed(context, '/firsttime');
                      // }
                    }),
                    // AuthStateChangeAction<CredentialLinked>((context, state) {
                    //   // if (!state.user.emailVerified) {
                    //   //   Navigator.pushNamed(context, '/verify-email');
                    //   // } else {
                    //   Navigator.pushReplacementNamed(context, '/home');
                    //   // }
                    // }),
                    // mfaAction,
                    // EmailLinkSignInAction((context) {
                    //   Navigator.pushReplacementNamed(context, '/email-link-sign-in');
                    // }),
                  ],
                  styles: const {
                    EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
                  },
                  headerBuilder: headerImage('images/logoappBar.png'),
                  sideBuilder: sideImage('assets/google.png'),
                  subtitleBuilder: (context, action) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        action == AuthAction.signIn
                            ? 'Welcome to SelfHeal! Please sign in to continue.'
                            : 'Welcome to SelfHeal! Please create an account to continue',
                      ),
                    );
                  },
                  // footerBuilder: (context, action) {
                  //   return Center(
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(top: 16),
                  //       child: Text(
                  //         action == AuthAction.signIn
                  //             ? 'By signing in, you agree to our terms and conditions.'
                  //             : 'By registering, you agree to our terms and conditions.',
                  //         style: const TextStyle(color: Colors.grey),
                  //       ),
                  //     ),
                  //   );
                  // },
                ),
              )
            : DoubleBack(message: "Press back again to exit", child: Main()),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        splashIconSize: 250,
        duration: 3000,
      );
}

class Main extends StatefulWidget {
  Main({Key? key, this.donetuto}) : super(key: key);
  bool? donetuto;

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currIndex = 0;
  GlobalKey keyOne = GlobalKey();
  GlobalKey keyTwo = GlobalKey();
  GlobalKey keyThree = GlobalKey();
  GlobalKey keyFour = GlobalKey();
  GlobalKey keyFive = GlobalKey();

  var screens = [
    const Home(),
    const Hotline(),
    FAQ(),
    const Profile(),
  ];

  // startShowCase() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     ShowCaseWidget.of(context)
  //         .startShowCase([keyOne, keyTwo, keyThree, keyFour, keyFive]);
  //   });
  // }

  @override
  void initState() {
    // startShowCase();
    //   widget.donetuto = true;

    if (widget.donetuto == false) {
      WidgetsBinding.instance.addPostFrameCallback((_) async =>
          ShowCaseWidget.of(context)
              .startShowCase([keyOne, keyTwo, keyThree, keyFour, keyFive]));
      widget.donetuto = true;
      print(widget.donetuto);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var divHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: divHeight / 2 * 0.2,
        title: CustomShowcase1(
          description:
              'Welcome to SelfHeal!\n\nLet\'s go through  a quick tutorial to guide you on how to use the app.',
          globalKey: keyOne,
          child: Container(
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.black)),
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              child:
                  Image.asset('images/logoappBar.png', fit: BoxFit.fitHeight)),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        // actions: [
        //   Padding(
        //       padding: const EdgeInsets.only(right: 20.0),
        //       child: GestureDetector(
        //           onTap: () {
        //             // Navigator.pushNamed(context, '/profile');
        //             Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => const Profile()),
        //             );
        //           },
        //           child: const Icon(
        //             Icons.account_circle,
        //             size: 40,
        //           )))
        // ]
      ),
      body: screens[_currIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xff333333),
          showUnselectedLabels: false,
          currentIndex: _currIndex,
          items: [
            // navBarItem('images/home2.png', 'images/home.png', 'Home'),
            // navBarItem('images/hotline2.png', 'images/hotline.png', 'Hotline'),
            // navBarItem('images/faq2.png', 'images/faq.png', ''),
            // navBarItem('images/user2.png', 'images/user.png', 'Profile'),
            navBarHome('images/home2.png', 'images/home.png', 'Home'),
            navBarHotline(
                'images/hotline2.png', 'images/hotline.png', 'Hotline'),
            navBarFAQ('images/faq2.png', 'images/faq.png', ''),
            navBarProfile('images/user2.png', 'images/user.png', 'Profile'),
          ],
          onTap: (index) {
            setState(() {
              _currIndex = index;
            });
          }),
    );
  }

  // BottomNavigationBarItem navBarItem(
  //     String image, String activeImage, String name) {
  //   return BottomNavigationBarItem(
  //       icon: Image.asset(
  //         image,
  //         height: 50,
  //       ),
  //       label: name,
  //       // selectedLabelStyle: TextStyle(color: Colors.black),
  //       backgroundColor: const Color(0xff333333),
  //       activeIcon: Image.asset(
  //         activeImage,
  //         height: 50,
  //       ));
  // }

  BottomNavigationBarItem navBarHome(
      String image, String activeImage, String name) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          image,
          height: 50,
        ),
        label: name,
        // selectedLabelStyle: TextStyle(color: Colors.black),
        backgroundColor: const Color(0xff333333),
        activeIcon: CustomShowcase2(
          description:
              'Home Page\n\nThe page willl indicate what you are going to do within your 7-days '
              'self-healing journey. Your objective will be to complete all of the activities within'
              ' a day. The activities that you will be doing is categorized to Cognitive, Spirituality, '
              'Psychological and Physical.',
          globalKey: keyTwo,
          child: Image.asset(
            activeImage,
            height: 50,
          ),
        ));
  }

  BottomNavigationBarItem navBarHotline(
      String image, String activeImage, String name) {
    return BottomNavigationBarItem(
        icon: CustomShowcase2(
          description:
              'Hotline Page\n\nIf you ever feel the need to talk to someone, here you can find out who to approach.',
          globalKey: keyThree,
          child: Image.asset(
            image,
            height: 50,
          ),
        ),
        label: name,
        // selectedLabelStyle: TextStyle(color: Colors.black),
        backgroundColor: const Color(0xff333333),
        activeIcon: Image.asset(
          activeImage,
          height: 50,
        ));
  }

  BottomNavigationBarItem navBarFAQ(
      String image, String activeImage, String name) {
    return BottomNavigationBarItem(
        icon: CustomShowcase2(
          description:
              'FAQ Page\n\nFAQ section list the questions and answers that you might want to check out.',
          globalKey: keyFour,
          child: Image.asset(
            image,
            height: 50,
          ),
        ),
        label: name,
        // selectedLabelStyle: TextStyle(color: Colors.black),
        backgroundColor: const Color(0xff333333),
        activeIcon: Image.asset(
          activeImage,
          height: 50,
        ));
  }

  BottomNavigationBarItem navBarProfile(
      String image, String activeImage, String name) {
    return BottomNavigationBarItem(
        icon: CustomShowcase2(
          description:
              'Profile Page\n\nEdit your profile or view your achievements and history of journey. You may also configure some setting. ',
          globalKey: keyFive,
          child: Image.asset(
            image,
            height: 50,
          ),
        ),
        label: name,
        // selectedLabelStyle: TextStyle(color: Colors.black),
        backgroundColor: const Color(0xff333333),
        activeIcon: Image.asset(
          activeImage,
          height: 50,
        ));
  }
}

class CustomShowcase1 extends StatelessWidget {
  final Widget child;
  final String description;
  final GlobalKey globalKey;
  // final String title;

  const CustomShowcase1({
    super.key,
    required this.child,
    required this.description,
    required this.globalKey,
    // required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Showcase(
      overlayOpacity: 0,
      blurValue: 3,
      disableMovingAnimation: true,
      showArrow: false,
      descriptionAlignment: TextAlign.center,
      //  titleAlignment: TextAlign.center,
      key: globalKey,
      tooltipBackgroundColor: Colors.green,
      tooltipPadding: const EdgeInsets.all(20),
      // title: title,
      titleTextStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
      description: description,
      descTextStyle: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      child: child,
    );
  }
}

class CustomShowcase2 extends StatelessWidget {
  final Widget child;
  final String description;
  final GlobalKey globalKey;
  // final String title;

  const CustomShowcase2({
    super.key,
    required this.child,
    required this.description,
    required this.globalKey,
    // required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Showcase(
      // overlayOpacity: 0,
      // blurValue: 3,
      // disableMovingAnimation: true,
      // showArrow: false,
      descriptionAlignment: TextAlign.justify,
      //  titleAlignment: TextAlign.center,
      key: globalKey,


      tooltipBackgroundColor: const Color.fromARGB(255, 97, 172, 99),
      tooltipPadding: const EdgeInsets.all(20),
      // title: title,
      titleTextStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
      description: description,
      descTextStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      child: child,
    );
  }
}
