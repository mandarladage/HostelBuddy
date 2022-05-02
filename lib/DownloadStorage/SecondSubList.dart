import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SecondSubList extends StatefulWidget {
  const SecondSubList({Key? key}) : super(key: key);

  @override
  _SecondSubListState createState() => _SecondSubListState();
}

class _SecondSubListState extends State<SecondSubList> {
  @override
  Widget build(BuildContext context) {
    CollectionReference hostel =
        FirebaseFirestore.instance.collection('Hostel');

    return FutureBuilder<DocumentSnapshot>(
      future: hostel.doc('yuvisangela@gmail.com').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
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

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> myHostel =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
              body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                ClipRRect(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50)),
                    child: Stack(
                      children: [
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/bgimagewp.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        Positioned.fill(
                          child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                Colors.black.withOpacity(0.6),
                                Colors.transparent
                              ]))),
                        ),
                      ],
                    )),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //First coloumn for hostel details
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset.zero,
                                      blurRadius: 20,
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 0, top: 10),
                                    child: Text(
                                      //myHostel['myHostel'], //"Hostel NAme",
                                      myHostel?['HO_Name'] ?? '',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5, top: 5),
                                    child: Text(
                                      'Ho Facilities: ${myHostel?['HO_Facility']}' ??
                                          '',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5, top: 5),
                                    child: Text(
                                      'Ho Rent: ${myHostel?['HO_Rent']}' ?? '',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5, top: 5),
                                    child: Text(
                                      'Ho Rentcycle: ${myHostel?['HO_RentCycle']}' ??
                                          '',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5, top: 5),
                                    child: Text(
                                      'Available rooms: ${myHostel?['HO_Avail_Rooms']}' ??
                                          '',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Buttons related to next action
                          MycustomBtn(
                              Colors.green, Icons.access_alarms, 'Book Now'),
                          MycustomBtn(
                              Colors.indigo, Icons.map, 'Show me the location'),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ));
        }

        return Center(
            child: SizedBox(
          child: CircularProgressIndicator(),
          width: 40,
          height: 40,
        ));
      },
    );
  }
}

Widget MycustomBtn(Color Btncolor, iconPassed, labelValue) {
  final IconData? icon = iconPassed;
  final String label = labelValue;
  final Color color = Btncolor;

  return Container(
    margin: EdgeInsets.all(10),
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(offset: Offset.zero, blurRadius: 1, color: Colors.black)
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          Icon(
            icon,
            size: 25,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    ),
  );
}
