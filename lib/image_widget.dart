import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ImageSource?> showImageSource(BuildContext context) async {
  return showModalBottomSheet(
      context: context,
      builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () => Navigator.of(context).pop(ImageSource.camera)),
              ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Gallery'),
                  onTap: () => Navigator.of(context).pop(ImageSource.gallery))
            ],
          ));
}

Future<File?> getProfilePic() async {
  File? profilepic;
  final String userUID = FirebaseAuth.instance.currentUser!.uid;
  SharedPreferences pref = await SharedPreferences.getInstance();
  

  // if (pref.containsKey('temp$userUID')) {
  //   final tpath = pref.getString('temp$userUID')!;
  //   profilepic = File(tpath);
  //   // pref.remove('temp$userUID');
  // }else
  if (pref.containsKey('pic$userUID')) {
    // final directory = await getApplicationDocumentsDirectory();
    // final tpath = File('${directory.path}/temp$userUID.jpg');
    // if (await tpath.exists()) tpath.delete();
    final path = pref.getString('pic$userUID')!;
    profilepic = File(path);
  } else {
    // final directory = await getApplicationDocumentsDirectory();
    // final name = 'pic$userUID';
    // final filePath = "${directory.path}/$name.jpg";
    // final file = File(filePath);
    // try {
    //   await ref.writeToFile(file);
    //   profilepic = file;
    //   pref.setString(name, filePath);
    //   // ignore: empty_catches
    // } on FirebaseException catch (e) {
    //   // Caught an exception from Firebase.
    //   print("Failed with error '${e.code}': ${e.message}");
    // }
    // final downloadTask = ref.writeToFile(file);
    // try {
    //   downloadTask.snapshotEvents.listen((taskSnapshot) {
    //     switch (taskSnapshot.state) {
    //       case TaskState.running:
    //         // TODO: Handle this case.
    //         break;
    //       case TaskState.paused:
    //         // TODO: Handle this case.
    //         break;
    //       case TaskState.success:
    //         // TODO: Handle this case.
    //         profilepic = file;
    //         break;
    //       case TaskState.canceled:
    //         // TODO: Handle this case.
    //         profilepic = null;
    //         break;
    //       case TaskState.error:
    //         // TODO: Handle this case.

    //         profilepic = null;

    //         break;
    //     }
    //   });
    // } catch (e) {
    //   print('Download error: $e');
    // }

  }
  return profilepic;
}
