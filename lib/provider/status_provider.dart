import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Status with ChangeNotifier {
  // String uid = FirebaseAuth.instance.currentUser!.uid;

  int _stat = 1; //Day 1 Status
  int _stat2 = 0; //Day 2 Status //start w 0 as all grey
  int _stat3 = 0; //Day 3 Status
  int _stat4 = 0; //Day 4 Status
  int _stat5 = 0; //Day 5 Status
  int _stat6 = 0; //Day 6 Status
  int _stat7 = 0; //Day 7 Status

  int get stat => _stat;
  int get stat2 => _stat2;
  int get stat3 => _stat3;
  int get stat4 => _stat4;
  int get stat5 => _stat5;
  int get stat6 => _stat6;
  int get stat7 => _stat7;

  Future<void> chg(String day, int varStat, String UID) async {
    //String UID extension
    SharedPreferences pref = await SharedPreferences.getInstance();
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$UID");

    switch (day) {
      case 'd1':
        {
          pref.setInt('stateDay1$UID', varStat);
          ref.update({"stateDay1": varStat});
          print(pref.getInt('stateDay1$UID'));
          print(UID);
          _stat = varStat;
          notifyListeners();
        }
        break;
      case 'd2':
        {
          pref.setInt('stateDay2$UID', varStat);
          ref.update({"stateDay2": varStat});
          print(pref.getInt('stateDay2$UID'));
          print(UID);
          _stat2 = varStat;
          notifyListeners();
        }
        break;
      case 'd3':
        {
          pref.setInt('stateDay3$UID', varStat);
          ref.update({"stateDay3": varStat});
          _stat3 = varStat;
          notifyListeners();
        }
        break;
      case 'd4':
        {
          pref.setInt('stateDay4$UID', varStat);
          ref.update({"stateDay4": varStat});
          _stat4 = varStat;
          notifyListeners();
        }
        break;
      case 'd5':
        {
          pref.setInt('stateDay5$UID', varStat);
          ref.update({"stateDay5": varStat});
          _stat5 = varStat;
          notifyListeners();
        }
        break;
      case 'd6':
        {
          pref.setInt('stateDay6$UID', varStat);
          ref.update({"stateDay6": varStat});
          _stat6 = varStat;
          notifyListeners();
        }
        break;
      case 'd7':
        {
          pref.setInt('stateDay7$UID', varStat);
          ref.update({"stateDay7": varStat});
          _stat7 = varStat;
          notifyListeners();
        }
        break;
    }
  }
}
