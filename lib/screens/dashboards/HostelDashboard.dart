import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_mega_project/Lists/ListCard.dart';
import 'package:my_mega_project/screens/DetailedViewOFHostel.dart';
import 'package:my_mega_project/screens/Drawer/NavigationDrawerWidget.dart';
import 'package:my_mega_project/screens/loginscreens/AddHostelToDatabase.dart';

class HostelDashboard extends StatelessWidget {
  final String email;
  static String HO_Name = '';
  static String HO_Facility = '';
  static String HO_nearby_clg = '';
  static String HO_avil_rooms = '';
  static String HO_rent = '';
  static String HO_rent_cycles = '';
  static String HO_photoUrl = '';
  static int isApproved = 0;
  static String userEmail = " ";
  HostelDashboard(this.email);

  @override
  Widget build(BuildContext context) {
    userEmail = email;
    CollectionReference hostel =
        FirebaseFirestore.instance.collection('Hostel');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5a0f86),
        title: ImageIcon(
          AssetImage('assets/images/logo2.png'),
          size: 100,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      drawer: NavigationDrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => AddHostelToDatabase(email)),
              (Route<dynamic> route) => false);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 29,
        ),
        backgroundColor: Colors.black,
        tooltip: 'Capture Picture',
        elevation: 5,
        splashColor: Colors.grey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: FutureBuilder<DocumentSnapshot>(
        future: hostel.doc(email).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Center(child: Text("Document does not exist"));
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> myHostel =
                snapshot.data!.data() as Map<String, dynamic>;

            if (snapshot.hasData) {
              if (myHostel['has_hostel'] == "1") {
                HO_photoUrl = myHostel['HO_photoUrl'];
                HO_Facility = myHostel['HO_Facility'];
                HO_nearby_clg = myHostel['HO_nearby_clg'];
                HO_Name = myHostel['HO_Name'];
                HO_rent = myHostel['HO_rent'];
                HO_rent_cycles = myHostel['HO_rent_cycles'];
                HO_avil_rooms = myHostel['HO_avil_rooms'];
                isApproved = myHostel['is_approved'];
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailedViewOfHostel()),
                      );
                    },
                    child: Hero(
                        tag: 'hostelDetail',
                        child: ListCard(
                            myHostel['HO_photoUrl'], myHostel['HO_Name'])));
              } else {
                return Center(
                  child: Text("Please add Hostel"),
                );
              }
            } else {
              return Center(
                child: Text("Please add Hostel"),
              );
            }
          }

          if (snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: Text("Please add Hostel"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: SizedBox(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
              width: 40,
              height: 40,
            ));
          }

          return Center(
              child: SizedBox(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
            width: 40,
            height: 40,
          ));
        },
      ),
    );
  }
}
