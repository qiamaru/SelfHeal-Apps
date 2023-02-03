import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> retrieveDatabase() async {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  DatabaseReference readref = FirebaseDatabase.instance.ref("users/$uid");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Reference ref = FirebaseStorage.instance.ref().child("ProfilePic'$uid'.jpg");

  //profilepic
  final directory = await getApplicationDocumentsDirectory();
  final name = 'pic$uid';
  final filePath = "${directory.path}/$name.jpg";
  final file = File(filePath);
  try {
    await ref.writeToFile(file);

    prefs.setString(name, filePath);
    // ignore: empty_catches
  } on FirebaseException catch (e) {
    // Caught an exception from Firebase.
    print("Failed with error '${e.code}': ${e.message}");
  }

  final data = await readref.get();

  // username
  prefs.setString("username$uid", data.child("username").value.toString());
  //firstday
  String firstday = data.child("firstday").value.toString();
  prefs.setInt("firstday$uid", int.parse(firstday));
  //donefirsttime
  prefs.setBool("donefirsttime$uid", true);
  print('${prefs.getBool("donefirsttime$uid")} done firstime');
  //stateDay1-7
  for (var i = 1; i < 8; i++) {
    prefs.setInt(
        'stateDay$i$uid', int.parse(data.child("stateDay$i").value.toString()));
    print(int.parse(data.child("stateDay$i").value.toString()));
    print("stateDay$i");
  }
  print("datamasukdulu");
  //Badge amount
  prefs.setInt(
      "cogBadge$uid", int.parse(data.child("cogBadge").value.toString()));
  print('cogBadge');
  prefs.setInt(
      "medBadge$uid", int.parse(data.child("medBadge").value.toString()));
  print('medBadge');
  prefs.setInt(
      "phyBadge$uid", int.parse(data.child("phyBadge").value.toString()));
  prefs.setInt(
      "psyBadge$uid", int.parse(data.child("psyBadge").value.toString()));
  //lvl
  prefs.setInt('lvlCog$uid', int.parse(data.child("lvlCog").value.toString()));
  print('lvlcog');
  prefs.setInt('lvlMed$uid', int.parse(data.child("lvlMed").value.toString()));
  prefs.setInt('lvlPhy$uid', int.parse(data.child("lvlPhy").value.toString()));
  prefs.setInt('lvlPsy$uid', int.parse(data.child("lvlPsy").value.toString()));
  //currentcap
  prefs.setInt('currentCapCog$uid',
      int.parse(data.child("currentCapCog").value.toString()));
  print('currentcog');
  prefs.setInt('currentCapMed$uid',
      int.parse(data.child("currentCapMed").value.toString()));
  prefs.setInt('currentCapPhy$uid',
      int.parse(data.child("currentCapPhy").value.toString()));
  prefs.setInt('currentCapPsy$uid',
      int.parse(data.child("currentCapPsy").value.toString()));
  // //division
  // prefs.setDouble('divisionCog$uid',
  //     double.parse(data.child("divisionCog").value.toString()));
  // print('divisionCog');
  // prefs.setDouble('divisionMed$uid',
  //     double.parse(data.child("divisionMed").value.toString()));
  // prefs.setDouble('divisionPhy$uid',
  //     double.parse(data.child("divisionPhy").value.toString()));
  // prefs.setDouble('divisionPsy$uid',
  //     double.parse(data.child("divisionPsy").value.toString()));

//Entered
  for (var i = 2; i < 8; i++) {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("users/$uid/entered$i");
    final snapshot = await ref.get();
    if (snapshot.exists) {
      prefs.setBool('entered$i$uid', true);
      print("entered$i");
    } else {
      print("takde entered$i");
    }
  }

  return true;
}
