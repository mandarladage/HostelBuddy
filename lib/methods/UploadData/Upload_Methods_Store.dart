import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

CollectionReference stores = FirebaseFirestore.instance.collection('Stores');

//This method adds the main store user collection in firebase
Future<void> addStoreUserCollection(
    fName, lName, cnNo, email, addr, S_Name, neraby_clg, city, district) {
  // Call the store's CollectionReference to add a new user
  return stores
      .doc(email)
      .set({
        'S_fName': fName, // John Doe
        'S_lName': lName, // Stokes and Sons
        'S_cnNo': cnNo, // 42
        'S_email': email, //
        'S_addr': addr,
        'S_Name': S_Name,
        'is_approved': 0,
        'S_nearby_clg': neraby_clg, // 42
        'S_city': city, // 42
        'S_district': district, // 42
      })
      .then((value) => {
            Fluttertoast.showToast(
                msg: "Store user added Successfully!!!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0)
          })
      .catchError((error) => print("Failed to add user: $error"));
}

//This method adds the subcollection photos in firebase
Future<void> addStorePhotosCollection(email, h_pro_pic, pic) {
  return stores
      .doc(email)
      .collection("Photos")
      .doc("$email|Photos")
      .set({
        'S_pro_pic': h_pro_pic, // John Doe
        'pic': pic, // Stokes and Sons
      })
      .then((value) => print("Store Photos Collection Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
