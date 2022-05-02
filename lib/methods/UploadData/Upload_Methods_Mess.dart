import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference mess = FirebaseFirestore.instance.collection('Mess');

Future<void> addMessUserCollection(
    fName, lName, cnNo, email, addr, M_Name, neraby_clg) {
  // Call the user's CollectionReference to add a new user
  return mess
      .doc(email)
      .set({
        'M_fName': fName, // John Doe
        'M_lName': lName, // Stokes and Sons
        'M_cnNo': cnNo, // 42
        'M_email': email, //
        'M_addr': addr,
        'M_Name': M_Name,
        'is_approved': 0,
        'M_nearby_clg': neraby_clg, // 42
      })
      .then((value) => print("Mess User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

// This is method to add hostel main collection to firebase hostel module
Future<void> addMessUserPhotosCollection(email, h_pro_pic, pic) {
  return mess
      .doc(email)
      .collection("Photos")
      .doc("$email|Photos")
      .set({
        'M_pro_pic': h_pro_pic, // John Doe
        'pic': pic, // Stokes and Sons
      })
      .then((value) => print("Photos Collection Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

// This is method to add hostel main collection to firebase hostel module
Future<void> addMessUserPlatesCollection(email, h_pro_pic, pic) {
  return mess
      .doc(email)
      .collection("Plates")
      .doc("$email|Plates")
      .collection("Veg")
      .doc("$email|Plates|Veg")
      .set({
        'plate_contents': h_pro_pic, // John Doe
        'price': pic, // Stokes and Sons
      })
      .then((value) => print("Photos Collection Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
