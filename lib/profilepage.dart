import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_firebaseauth/image_widget.dart';
import 'package:test_firebaseauth/settingpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? imageURL;
  final String userUID = FirebaseAuth.instance.currentUser!.uid;
  dynamic profilepic;
  dynamic preview;

  // void getImage() async {
  //   Reference ref =
  //       FirebaseStorage.instance.ref().child("ProfilePic'$userUID'.jpg");
  //   ref.getDownloadURL().then((value) {
  //     setState(() {
  //       imageURL = value;
  //       print(imageURL);
  //     });
  //   });
  // }

  FirebaseAuth? auth;
  //fetchAllBadges items
  int? cogBadge;
  int? medBadge;
  int? phyBadge;
  int? psyBadge;

  //fetchAllCurrentCapnAssignLvl items
  int? currentCapCog;
  int? currentCapMed;
  int? currentCapPhy;
  int? currentCapPsy;
  int? lvlCog;
  int? lvlMed;
  int? lvlPhy;
  int? lvlPsy;

  //fetchDivisionforAll items
  double? divisionCog;
  double? divisionMed;
  double? divisionPhy;
  double? divisionPsy;

  //usernamevar
  String? username;

  //chgto -> fetchAllBadges
  Future fetchAllBadges() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      cogBadge = sharedPreferences.getInt("cogBadge$userUID") ?? 0; //
      // print(share)
      print(cogBadge);
      medBadge = sharedPreferences.getInt('medBadge$userUID') ?? 0;
      phyBadge = sharedPreferences.getInt("phyBadge$userUID") ?? 0;
      psyBadge = sharedPreferences.getInt("psyBadge$userUID") ?? 0;
    });
  }

  //chgto -> fetchAllCurrentCapnAssignLvl
  Future fetchAllCurrentCapnAssignLvl() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$userUID");
    setState(() {
      currentCapCog = sharedPreferences.getInt("currentCapCog$userUID") ?? 5;
      lvlCog = currentCapCog! ~/ 5;
      sharedPreferences.setInt('lvlCog$userUID', lvlCog!);
      ref.update({"lvlCog": lvlCog!});
      // print(currentCapCog);

      currentCapMed = sharedPreferences.getInt("currentCapMed$userUID") ?? 5;
      lvlMed = currentCapMed! ~/ 5;
      sharedPreferences.setInt('lvlMed$userUID', lvlMed!);
      ref.update({"lvlMed": lvlMed!});

      currentCapPhy = sharedPreferences.getInt("currentCapPhy$userUID") ?? 5;
      lvlPhy = currentCapPhy! ~/ 5;
      sharedPreferences.setInt('lvlPhy$userUID', lvlPhy!);
      ref.update({"lvlPhy": lvlPhy!});

      currentCapPsy = sharedPreferences.getInt("currentCapPsy$userUID") ?? 5;
      lvlPsy = currentCapPsy! ~/ 5;
      sharedPreferences.setInt('lvlPsy$userUID', lvlPsy!);
      ref.update({"lvlPsy": lvlPsy!});
    });
  }

  //chgto -> fetchDivisionforAll
  Future fetchDivision() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      divisionCog = sharedPreferences.getDouble("divisionCog$userUID") ?? 0;
      // print(division);
      divisionMed = sharedPreferences.getDouble("divisionMed$userUID") ?? 0;
      divisionPhy = sharedPreferences.getDouble("divisionPhy$userUID") ?? 0;
      divisionPsy = sharedPreferences.getDouble("divisionPsy$userUID") ?? 0;
    });
  }

  //chgto -> setCapnDivisionforAll
  Future setCapnDivisionforAll() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$userUID");
    setState(() {
      //cognitive
      if (cogBadge! > currentCapCog!) {
        sharedPreferences.setInt("currentCapCog$userUID", currentCapCog! + 5);
        ref.update({"currentCapCog": currentCapCog!});
        currentCapCog = currentCapCog! + 5;
      }
      fetchAllCurrentCapnAssignLvl();
      double result = cogBadge! / currentCapCog!;
      sharedPreferences.setDouble("divisionCog$userUID", result);
      ref.update({"divisionCog": result});

      //meditate
      if (medBadge! > currentCapMed!) {
        sharedPreferences.setInt("currentCapMed$userUID", currentCapMed! + 5);
        currentCapMed = currentCapMed! + 5;
        ref.update({"currentCapMed": currentCapMed!});
      }
      fetchAllCurrentCapnAssignLvl();
      double result2 = medBadge! / currentCapMed!;
      sharedPreferences.setDouble("divisionMed$userUID", result2);
      ref.update({"divisionMed": result2});

      //physics
      if (phyBadge! > currentCapPhy!) {
        sharedPreferences.setInt("currentCapPhy$userUID", currentCapPhy! + 5);
        ref.update({"currentCapPhy": currentCapPhy!});
        currentCapPhy = currentCapPhy! + 5;
      }
      fetchAllCurrentCapnAssignLvl();
      double result3 = phyBadge! / currentCapPhy!;
      sharedPreferences.setDouble("divisionPhy$userUID", result3);
      ref.update({"divisionPhy": result3});

      //psychology
      if (psyBadge! > currentCapPsy!) {
        sharedPreferences.setInt("currentCapPsy$userUID", currentCapPsy! + 5);
        ref.update({"currentCapPsy": currentCapPsy!});
        currentCapPsy = currentCapPsy! + 5;
      }
      fetchAllCurrentCapnAssignLvl();
      double result4 = psyBadge! / currentCapPsy!;
      sharedPreferences.setDouble("divisionPsy$userUID", result4);
      ref.update({"divisionPsy": result4});
    });
  }

  Future<void> removeSPforAll() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    setState(() {
      //cognitive
      sharedPrefs.remove('cogBadge$userUID');
      sharedPrefs.remove('currentCapCog$userUID');
      sharedPrefs.remove('divisionCog$userUID');
      //meditate
      sharedPrefs.remove('medBadge$userUID');
      sharedPrefs.remove('currentCapMed$userUID');
      sharedPrefs.remove('divisionMed$userUID');
      //physics
      sharedPrefs.remove('phyBadge$userUID');
      sharedPrefs.remove('currentCapPhy$userUID');
      sharedPrefs.remove('divisionPhy$userUID');
      //psycho
      sharedPrefs.remove('psyBadge$userUID');
      sharedPrefs.remove('currentCapPsy$userUID');
      sharedPrefs.remove('divisionPsy$userUID');
    });
  }

  //chgto -> fetchusername
  Future fetchUsername() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      username = sharedPreferences.getString('username$userUID');
    });
  }

  Future<void> getImage() async {
    profilepic = await getProfilePic();
  }

  @override
  void initState() {
    // removeSPforAll();
    fetchAllBadges();
    fetchAllCurrentCapnAssignLvl();
    setCapnDivisionforAll();
    fetchDivision();
    print(userUID);
    getImage();

    fetchUsername();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var divHeight = MediaQuery.of(context).size.height;
    var divWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff8AD16A),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Setting(
                                profilepic: profilepic,
                              )),
                    ).then((_) => setState(() {
                          getImage();
                          fetchUsername();
                        }));
                  },
                  child: const Icon(
                    Icons.settings,
                    size: 35,
                  )))
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xff666666),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                // height: divHeight * .2,
                padding: const EdgeInsets.all(20),
                margin: EdgeInsets.only(
                    top: divHeight * .03,
                    left: divWidth * .05,
                    right: divWidth * .05),
                child: Row(
                  children: [
                    Expanded(
                      // flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Username",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(username ?? '',
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                          ElevatedButton.icon(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18)))),
                              onPressed: () {
                                FirebaseUIAuth.signOut(
                                  context: context,
                                  auth: auth,
                                );
                                print('LOG OUT -----------');
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/auth', ModalRoute.withName('/'));
                              },
                              icon: const Icon(Icons.logout_sharp),
                              label: const Text('Log Out'))
                        ],
                      ),
                    ),
                    Expanded(
                      // flex: 1,
                      child: profilepic != null
                          ? CircleAvatar(
                              backgroundImage: FileImage(profilepic!),
                              radius: 60,
                            )
                          // Image. file
                          : const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              // ignore: unnecessary_null_comparison
                              child: Icon(
                                Icons.account_circle,
                                size: 100,
                                color: Colors.grey,
                              )),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: divWidth * .08, top: divHeight * .02),
                padding: const EdgeInsets.symmetric(vertical: 10),
                // color: Colors.amber,
                child: const Text(
                  'Achievement',
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xff666666),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                // height: divHeight * .2,
                padding: const EdgeInsets.all(20),
                margin: EdgeInsets.only(
                    left: divWidth * .05, right: divWidth * .05),
                child: Column(
                  children: [
                    //start cognitive
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 40,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  AssetImage('images/cognitive.png'),
                              backgroundColor: Color(0xffFFD700),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: divWidth * .05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Cognitive",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: LinearProgressIndicator(
                                    minHeight: divHeight * .03,
                                    value: divisionCog,
                                    color: Colors.blue,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Level $lvlCog",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    Text("$cogBadge/$currentCapCog badge(s)",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))
                                  ],
                                ),
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
                          flex: 1,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 40,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  AssetImage('images/meditate.png'),
                              backgroundColor: Color(0xffFFD700),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: divWidth * .05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Spiritual",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: LinearProgressIndicator(
                                    minHeight: divHeight * .03,
                                    value: divisionMed,
                                    color: Colors.blue,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Level $lvlMed",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    Text("$medBadge/$currentCapMed badge(s)",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))
                                  ],
                                ),
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
                          flex: 1,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 40,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage('images/physic.png'),
                              backgroundColor: Color(0xffFFD700),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: divWidth * .05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Physical",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: LinearProgressIndicator(
                                    minHeight: divHeight * .03,
                                    value: divisionPhy,
                                    color: Colors.blue,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Level $lvlPhy",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    Text("$phyBadge/$currentCapPhy badge(s)",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    //start psycho
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 40,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage('images/psycho.png'),
                              backgroundColor: Color(0xffFFD700),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: divWidth * .05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Psychology",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: LinearProgressIndicator(
                                    minHeight: divHeight * .03,
                                    value: divisionPsy,
                                    color: Colors.blue,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Level $lvlPsy",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    Text("$psyBadge/$currentCapPsy badge(s)",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //start Legends
              Container(
                margin:
                    EdgeInsets.only(left: divWidth * .08, top: divHeight * .01),
                padding: const EdgeInsets.symmetric(vertical: 10),
                // color: Colors.amber,
                child: const Text(
                  'Legend',
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xff666666),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                // height: divHeight * .2,
                padding: const EdgeInsets.all(20),
                margin: EdgeInsets.only(
                    left: divWidth * .05, right: divWidth * .05),
                child: Column(
                  children: [
                    //start cognitive
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: divWidth * .05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "Cognitive",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    child: Text(
                                      'Be able to make a decision during crucial moment is one of cognitive skills.',
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: divWidth * .03),
                        const Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 40,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  AssetImage('images/cognitive.png'),
                              backgroundColor: Color(0xffFFD700),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    //start meditate
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: divWidth * .05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "Spiritual",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  // textAlign: TextAlign.end,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    child: Text(
                                      'Calm down help yourself to see the bigger picture of the tragedy happened in your life.',
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: divWidth * .03),
                        const Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 40,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  AssetImage('images/meditate.png'),
                              backgroundColor: Color(0xffFFD700),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    //start Physics
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: divWidth * .05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "Physical",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  // textAlign: TextAlign.end,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    child: Text(
                                      'Healthier body mean healthier life, healthier life lead to happy life.',
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: divWidth * .03),
                        const Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 40,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage('images/physic.png'),
                              backgroundColor: Color(0xffFFD700),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    //start psycho
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: divWidth * .05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "Psychology",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  // textAlign: TextAlign.end,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 6.0),
                                    child: Text(
                                      'Life is full of suprise. Experiencing new things is a way to get motivation.',
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: divWidth * .03),
                        const Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 40,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage('images/psycho.png'),
                              backgroundColor: Color(0xffFFD700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30)
              //end of big column in listview
            ],
          ),
        ],
      ),
    );
  }
}
