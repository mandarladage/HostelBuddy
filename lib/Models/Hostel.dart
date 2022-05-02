import 'package:cloud_firestore/cloud_firestore.dart';

class Hostel {
  late final String? HO_Name;
  late final String? HO_Email;
  late final String? HO_addr;
  late final String? HO_nearby_clg;
  late final String? HO_Facility;
  late final String? HO_Rent;
  late final String? HO_RentCycle;
  late final String? HO_Avail_Rooms;
  late final String? HO_CnNo;
  late final String? is_approved;

  Hostel(
      {required this.HO_Name,
      required this.HO_Email,
      required this.HO_addr,
      required this.HO_nearby_clg,
      required this.HO_Facility,
      required this.HO_Rent,
      required this.HO_RentCycle,
      required this.HO_Avail_Rooms,
      required this.HO_CnNo,
      this.is_approved});

  Map<String, dynamic> toJson() => {
        "HO_Name": HO_Name,
        "HO_Facility": HO_Facility,
        "HO_addr": HO_addr,
        "HO_Email": HO_Email,
        "HO_nearby_clg": HO_nearby_clg,
        "HO_Avail_Rooms": HO_Avail_Rooms,
        "HO_CnNo": HO_CnNo,
        "HO_Rent": HO_Rent,
        "HO_RentCycle": HO_RentCycle,
      };

  static Hostel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Hostel(
      HO_Name: snapshot['HO_Name'],
      HO_Facility: snapshot['HO_Facility'],
      HO_addr: snapshot['HO_addr'],
      HO_Email: snapshot['HO_Email'],
      HO_Avail_Rooms: snapshot['HO_Avail_Rooms'],
      HO_nearby_clg: snapshot['HO_nearby_clg'],
      HO_CnNo: snapshot['HO_CnNo'],
      HO_Rent: snapshot['HO_Rent'],
      HO_RentCycle: snapshot['HO_RentCycle'],
      is_approved: snapshot['is_approved'],
    );
  }

  Hostel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    HO_Name:
    snapshot['HO_Name'];
    HO_Facility:
    snapshot['HO_Facility'];
    HO_addr:
    snapshot['HO_addr'];
    HO_Email:
    snapshot['HO_Email'];
    HO_Avail_Rooms:
    snapshot['HO_Avail_Rooms'];
    HO_nearby_clg:
    snapshot['HO_nearby_clg'];
    HO_CnNo:
    snapshot['HO_CnNo'];
    HO_Rent:
    snapshot['HO_Rent'];
    HO_RentCycle:
    snapshot['HO_RentCycle'];
    is_approved:
    snapshot['is_approved'];
  }
}
