import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import 'package:image_picker/image_picker.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'deleteconfirm.dart';
import 'image_widget.dart';

import 'package:flutter/material.dart' hide Title;

import 'savesettingdialog.dart';

class Setting extends StatefulWidget {
  const Setting({
    Key? key,
    required this.profilepic,
  }) : super(key: key);
  final File? profilepic;

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final String userUID = FirebaseAuth.instance.currentUser!.uid;

  FirebaseAuth? auth;
  List<AuthProvider<AuthListener, AuthCredential>>? providers;

  dynamic preview;

  dynamic imgPerman;
  String? username; // final String email = 'email from firebase';

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  void uploadImage() async {
    Reference ref =
        FirebaseStorage.instance.ref().child("ProfilePic'$userUID'.jpg");
    await ref.putFile(preview!);
  }

  void pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
        source: source, maxHeight: 512, maxWidth: 512,
        // imageQuality: 75
      );
      final temp = File(image!.path);

      setState(() {
        preview = temp;
        // saveImgLocal(image.path);
        imgPerman = image.path;
      });

      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> saveImgLocal(String imgPath) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imgPath);
    final tname = 'temp$userUID';
    final image = File('${directory.path}/$userUID$name');
    // final temp = File('${directory.path}/$tname.jpg');
    String? prior = pref.getString(tname);
    if (prior != null && prior != image.path) File(prior).delete();
    pref.setString('pic$userUID', '${directory.path}/$userUID$name');
    pref.setString(tname, '${directory.path}/$userUID$name');

    File(imgPath).copy(image.path);
    // File(imgPath).copy(temp.path);
  }

  Future fetchUsername() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      username = sharedPreferences.getString('username$userUID')!;
    });
  }

  //chgto -> setUsername
  Future setUsername(String input) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      // final String userUID = FirebaseAuth.instance.currentUser!.uid;
      DatabaseReference ref = FirebaseDatabase.instance.ref("users/$userUID");
      sharedPreferences.setString('username$userUID', input);
      ref.update({"username": input});
      username = input;
    });
  }

  @override
  void initState() {
    super.initState();

    fetchUsername();
    // usernamecontroller.text = username??'';
    // emailcontroller.text = 'email from firebase' ?? '';
  }

  // Future<bool> _reauthenticate(BuildContext context) {
  //   // final l = FirebaseUILocalizations.labelsOf(context);

  //   return showReauthenticateDialog(
  //     context: context,
  //     providers: providers!,
  //     auth: auth,
  //     onSignedIn: () => Navigator.of(context).pop(true),
  //     // actionButtonLabelOverride: l.deleteAccount,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var divHeight = MediaQuery.of(context).size.height;
    var divWidth = MediaQuery.of(context).size.width;
    bool confirm = false;

    return KeyboardDismisser(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xff8AD16A),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: (() => Navigator.pop(context)),
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                )),
            title: const Text('Setting'),
            centerTitle: true,
          ),
          body: Container(
              decoration: const BoxDecoration(
                  color: Color(0xff031606),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          // flex: 1,
                          child: preview != null
                              ? CircleAvatar(
                                  backgroundImage: FileImage(preview!),
                                  radius: 60,
                                )
                              // ? ClipOval(
                              //     clipper: MyClipper(),
                              //     child: Image.file(
                              //       preview!,
                              //       fit: BoxFit.contain,
                              //     ))
                              : widget.profilepic != null
                                  ? CircleAvatar(
                                      backgroundImage:
                                          FileImage(widget.profilepic!),
                                      radius: 60,
                                    )
                                  : const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 50,
                                      // ignore: unnecessary_null_comparison
                                      child: Icon(
                                        Icons.account_circle,
                                        size: 100,
                                        color: Colors.grey,
                                      )),
                        ),
                        Expanded(
                          // flex: 2,
                          child: InkWell(
                            child: const Text(
                              "Change photo",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            onTap: () async {
                              final source = await showImageSource(context);
                              if (source == null) return;
                              pickImage(source);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: divHeight * .03),
                  const Text(
                    "Change Username",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: divWidth * .02),
                    child:
                        //EditableUserDisplayName(auth: auth)
                        TextField(
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      controller: usernamecontroller,
                      // enabled: false,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: username,
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 20),
                          contentPadding: const EdgeInsets.all(8),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ),
                  SizedBox(height: divHeight * .01),
                  // const Text(
                  //   "Email",
                  //   style: TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.white),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: divWidth * .02),
                  //   child: TextField(
                  //     controller: emailcontroller,
                  //     // enabled: false,
                  //     decoration: const InputDecoration(
                  //         isDense: true,
                  //         // hintText: email,
                  //         hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                  //         contentPadding: EdgeInsets.all(8),
                  //         filled: true,
                  //         fillColor: Colors.white),
                  //   ),
                  // ),
                  SizedBox(height: divHeight * .03),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/reset-password');
                        },
                        icon: const Icon(Icons.change_circle),
                        label: const Text(
                          'Change Password',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  SizedBox(height: divHeight * .04),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () async {
                          bool result = await showDialog(
                                context: context,
                                builder: (context) =>
                                    DeleteConfirmDialog(confirm: confirm),
                              ) ??
                              false;

                          if (result) {
                            print('dah delete n sign out');
                            DatabaseReference dataref =
                                FirebaseDatabase.instance.ref("users/$userUID");
                            // Reference photoref = FirebaseStorage.instance
                            //     .ref()
                            //     .child("ProfilePic'$userUID'.jpg");
                            // try {
                            //   photoref.delete();
                            // } catch (e) {
                            //   // Caught an exception from Firebase.
                            //   // print(
                            //   //     "Failed with error '${e.code}': ${e.message}");
                            // }

                            FirebaseUIAuth.signOut(
                                context: context, auth: auth);
                            FirebaseAuth.instance.currentUser!.delete();
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/auth', ModalRoute.withName('/'));
                            dataref.remove();
                            // SharedPreferences sharedPrefs =
                            //     await SharedPreferences.getInstance();
                            // sharedPrefs.clear();

                            // Restart.restartApp();
                          }
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text(
                          'Delete Account',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  SizedBox(height: divHeight * .03),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (preview != null) {
                            uploadImage();
                            saveImgLocal(imgPerman);
                          }

                          if (usernamecontroller.text != '') {
                            setUsername(usernamecontroller.text);
                            setState(() {
                              usernamecontroller.text = '';
                            });
                          }
                          Timer(
                              const Duration(milliseconds: 200),
                              () => showAnimatedDialog<void>(
                                  animationType: DialogTransitionType.fadeScale,
                                  barrierDismissible: true,
                                  duration: const Duration(milliseconds: 350),
                                  context: context,
                                  builder: (_) => const SaveSettingDialog()));
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.fromLTRB(20, 8, 20, 8)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xffD9D9D9))),
                        child: const Text(
                          'SAVE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 6, 92, 162)),
                        )),
                  )
                ],
              ))),
    );
  }
}
