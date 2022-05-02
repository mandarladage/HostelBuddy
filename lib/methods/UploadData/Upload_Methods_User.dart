import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference users = FirebaseFirestore.instance.collection('Reg_users');

Future<void> addNormalUser(fName, lName, cnNo, email, addr, city, district) {
  // Call the user's CollectionReference to add a new user
  return users
      .doc(email)
      .set({
        'u_fName': fName, // John Doe
        'u_lName': lName, // Stokes and Sons
        'u_cnNo': cnNo, // 42
        'u_email': email, //
        'u_addr': addr, // 42
        'u_city': city, // 42
        'u_district': district // 42
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> addUserPhotosCollection(email, h_pro_pic, pic) {
  return users
      .doc(email)
      .collection("Photos")
      .doc("$email|Photos")
      .set({
        'U_pro_pic': h_pro_pic, // John Doe
        'pic': pic, // Stokes and Sons
      })
      .then((value) => print("User Photos Collection Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> addUserDocCollection(email, dName, dRefId, dDate) {
  return users
      .doc(email)
      .collection("Docs")
      .doc("$email|Docs")
      .set({
        'u_doc_name': dName, // John Doe
        'u_doc_ref_id': dRefId, // Stokes and Sons
        'u_doc_uploaded_date': dDate, // Stokes and Sons
      })
      .then((value) => print("Photos Collection Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
