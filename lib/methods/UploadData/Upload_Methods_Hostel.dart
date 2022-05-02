import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_mega_project/screens/loginscreens/AddHostelToDatabase.dart';
import 'package:path/path.dart' as path;

CollectionReference hostels = FirebaseFirestore.instance.collection('Hostel');

// This is method to add hostel main collection to firebase hostel module
Future<void> addHostelUserCollection(fName, lName, cnNo, email, addr, h_Name,
    neraby_clg, rent, rent_cycles, avRooms) {
  // Call the user's CollectionReference to add a new user
  return hostels
      .doc(email)
      .set({
        'HO_fName': fName, // John Doe
        'HO_lName': lName, // Stokes and Sons
        'HO_cnNo': cnNo, // 42
        'HO_email': email, //
        'HO_addr': addr,
        'HO_Name': h_Name,
        'is_approved': 0,
        'HO_nearby_clg': neraby_clg, // 42
        'HO_avil_rooms': avRooms,
        'HO_rent': rent,
        'HO_rent_cycles': h_Name,
      })
      .then((value) => print("Hostel User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

// This is method to add hostel main collection to firebase hostel module
Future<void> addHostelUserPhotosCollection(email, h_pro_pic, pic) {
  return hostels
      .doc(email)
      .collection("Photos")
      .doc("$email|Photos")
      .set({
        'h_pro_pic': h_pro_pic, // John Doe
        'pic': pic, // Stokes and Sons
      })
      .then((value) => print("Photos Collection Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> registerHostelUser(fName, lName, email, password, addr, cnNo) {
  // Call the user's CollectionReference to add a new user
  return hostels
      .doc(email)
      .set({
        'HO_fName': fName, // John Doe
        'HO_lName': lName, // Stokes and Sons
        'HO_cnNo': cnNo, // 42
        'HO_email': email, //
        'HO_addr': addr,
        'is_approved': 0,
        'HO_password': password, // 42
      })
      .then((value) => print("Hostel User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> updateUserPersonalData(fName, lName, email, addr, cnNo) {
  // Call the user's CollectionReference to add a new user
  return hostels
      .doc(email)
      .update({
        'HO_fName': fName, // John Doe
        'HO_lName': lName, // Stokes and Sons
        'HO_cnNo': cnNo, // 42
        'HO_addr': addr,
      })
      .then((value) => print("Hostel User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> updateUserHostelData(email, HO_Name, HO_Facility, HO_nearby_clg,
    HO_rent, HO_rent_cycles, HO_avil_rooms) {
  // Call the user's CollectionReference to add a new user
  return hostels
      .doc(email)
      .update({
        'HO_Name': HO_Name,
        'HO_Facility': HO_Facility,
        'HO_nearby_clg': HO_nearby_clg, // 42
        'HO_avil_rooms': HO_avil_rooms,
        'HO_rent': HO_rent,
        'HO_rent_cycles': HO_rent_cycles,
      })
      .then((value) => print("Hostel Updated"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> addHostelFromDashboard(email, h_Name, facilities, neraby_clg, rent,
    rent_cycles, avRooms, photoUrl) {
  // Call the user's CollectionReference to add a new user
  return hostels
      .doc(email)
      .update({
        'HO_Name': h_Name,
        'HO_Facility': facilities,
        'HO_nearby_clg': neraby_clg, // 42
        'HO_avil_rooms': avRooms,
        'HO_rent': rent,
        'HO_rent_cycles': h_Name,
        'HO_photoUrl': photoUrl,
        'has_hostel': '1',
      })
      .then((value) => print("Hostel Photo Url Added"))
      .catchError((error) => print("Failed to add Hostel: $error"));
}

Future<bool> loginHostel(email, password) async {
  DocumentSnapshot documentSnapshot = await hostels.doc(email).get();
  var Temp = documentSnapshot.data() as Map<String, dynamic>;
  print(Temp['HO_email']);
  print(Temp['HO_password']);
  print("Temp Value is ------->>>>>>>  $Temp");
  if (Temp['HO_email'].toString() == email &&
      Temp['HO_password'].toString() == password) {
    print("It os True");
    return Future<bool>.value(true);
  } else {
    print("It os False");
    return Future<bool>.value(false);
  }
}

FirebaseStorage storage = FirebaseStorage.instance;

Future<void> uploadHostelImage(String inputSource, email) async {
  final picker = ImagePicker();
  XFile? pickedImage;
  try {
    pickedImage = await picker.pickImage(
        source:
            inputSource == 'camera' ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 1920,
        imageQuality: 30);

    final String fileName = path.basename(pickedImage!.path);
    File imageFile = File(pickedImage.path);
    final String myFileName = pickedImage.path.split('/').last;
    // File AfterCompressing = await compressMyImage(imageFile) as File;
    try {
      // Uploading the selected image with some custom meta data
      Reference ref = storage.ref('Hostel/$email/').child('$myFileName');
      UploadTask uploadTask = ref.putFile(imageFile);
      //var dowurl = await (await uploadTask.whenComplete(() => {}));
      await uploadTask.whenComplete(() => print('completed'));
      //uploadTask.snapshot.ref.getDownloadURL();
      //String retUrl = dowurl.toString();
      var downlodURl =
          await ref.getDownloadURL().whenComplete(() => {print("got it")});

      while (downlodURl == null) {}

      String myurl = downlodURl.toString();
      AddHostelToDatabase.tphoto = myurl;

      // Refresh the UI
      //setState(() {});
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
  }
}

/*
Future<File?> uploadHostelImage(String inputSource, email) async {
  final picker = ImagePicker();
  XFile? pickedImage;
  try {
    pickedImage = await picker.pickImage(
        source:
            inputSource == 'camera' ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 1920,
        imageQuality: 30);

    final String fileName = path.basename(pickedImage!.path);
    File imageFile = File(pickedImage.path);
    // File AfterCompressing = await compressMyImage(imageFile) as File;
    return imageFile;
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
  }
}

Future<String?> getAccessToken(Future<File?> imageFile, email) async {
  try {
    // Uploading the selected image with some custom meta data

    final String myFileName = imageFile..split('/').last;

    Reference ref = storage.ref('Hostel/$email/').child('$myFileName');

    UploadTask uploadTask = ref.putFile(imageFile);

    await uploadTask.whenComplete(() => print('completed'));

    var downlodURl =
        await ref.getDownloadURL().whenComplete(() => {print("got it")});

    while (downlodURl == null) {}

    String myurl = downlodURl.toString();

    return myurl;
    //AddHostelToDatabase.tphoto = myurl;
  } on FirebaseException catch (error) {
    if (kDebugMode) {
      print(error);
    }
  }
}
*/
