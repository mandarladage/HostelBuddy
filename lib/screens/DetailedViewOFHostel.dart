import 'package:flutter/material.dart';
import 'package:my_mega_project/screens/dashboards/HostelDashboard.dart';

class DetailedViewOfHostel extends StatelessWidget {
  const DetailedViewOfHostel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              child: Stack(
                children: [
                  Hero(
                    tag: 'hostelDetail',
                    child: Container(
                      height: 300,
                      child: Image.network(
                        HostelDashboard.HO_photoUrl,
                        fit: BoxFit.cover,
                      ),
                      // decoration: BoxDecoration(
                      //     image: Image.network(
                      //       Imageurl,
                      //       fit: BoxFit.cover,
                      //     ),),
                    ),
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
                              padding:
                                  const EdgeInsets.only(bottom: 0, top: 10),
                              child: Text(
                                //myHostel['myHostel'], //"Hostel NAme",
                                "Name: " + HostelDashboard.HO_Name,
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
                                "Facility: " + HostelDashboard.HO_Facility,
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
                                "Near Clg: " + HostelDashboard.HO_nearby_clg,
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
                                "Rent: " + HostelDashboard.HO_rent,
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
                                "Rent Cycle: " + HostelDashboard.HO_rent_cycles,
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
                                "Available Rooms: " +
                                    HostelDashboard.HO_avil_rooms,
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
                    MycustomBtn(Colors.green, Icons.access_alarms, 'Update'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
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
