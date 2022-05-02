import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_mega_project/Models/Hostel.dart';

class DataFetchServices {
  CollectionReference hostels = FirebaseFirestore.instance.collection('Hostel');

  //convert snapshot to model
  Hostel _hostelDataFromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> myHostel = snapshot.data() as Map<String, dynamic>;
    return Hostel(
        HO_Name: myHostel['HO_Name'],
        HO_CnNo: myHostel['HO_Name'],
        HO_RentCycle: myHostel['HO_Name'],
        HO_addr: myHostel['HO_Name'],
        HO_Facility: myHostel['HO_Name'],
        HO_Avail_Rooms: myHostel['HO_Name'],
        HO_nearby_clg: myHostel['HO_Name'],
        HO_Rent: myHostel['HO_Name'],
        HO_Email: myHostel['HO_Name']);
  }

  Stream<Hostel> get HostelData {
    return hostels
        .doc('yuvisangela@gmail.com')
        .snapshots()
        .map(_hostelDataFromSnapshot);
  }
}
