import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference users = FirebaseFirestore.instance.collection('Reg_users');
CollectionReference hostels = FirebaseFirestore.instance.collection('Hostel');
CollectionReference stores = FirebaseFirestore.instance.collection('Stores');
CollectionReference mess = FirebaseFirestore.instance.collection('Mess');

Future<void> addHostelUserRequestsCollection(email, reques_h_id) {
  return hostels
      .doc(email)
      .collection("Photos")
      .doc("$email|Photos")
      .set({
        // Stokes and Sons
      })
      .then((value) => print("Hostel User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
