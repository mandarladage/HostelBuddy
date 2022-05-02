import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_mega_project/methods/UploadData/Upload_Methods_Hostel.dart';
import 'package:my_mega_project/screens/dashboards/HostelDashboard.dart';

class AddHostelToDatabase extends StatelessWidget {
  final h_Name = TextEditingController();
  final HO_Facility = TextEditingController();
  final neraby_clg = TextEditingController();
  final HO_avil_rooms = TextEditingController();
  final HO_rent = TextEditingController();
  final HO_rent_cycles = TextEditingController();
  static String tphoto = '';
  final String email;

  AddHostelToDatabase(this.email);

  @override
  Widget build(BuildContext context) {
    double actualWidth = MediaQuery.of(context).size.width;
    double actualHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Color(0xFF5a0f86),
      child: Center(
        child: SizedBox(
          width: actualWidth * 0.75,
          height: actualHeight * 0.85,
          child: Card(
            elevation: 8,
            shadowColor: Colors.white,
            color: Color(0xFF8e18d2),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImageIcon(
                    AssetImage('assets/images/logo2.png'),
                    size: 100,
                    color: Colors.white,
                  ),
                  myTextInput('Hostel Name', h_Name, false),
                  myTextInput('Facilities', HO_Facility, false),
                  myTextInput('Nearby College', neraby_clg, false),
                  myTextInput('Rent', HO_rent, false),
                  myTextInput('Rent Cycles', HO_rent_cycles, false),
                  myTextInput('Available Rooms', HO_avil_rooms, false),
                  GestureDetector(
                    child: MycustomBtn(Colors.black, Icons.add_a_photo_outlined,
                        'Upload Photo'),
                    onTap: () {
                      uploadHostelImage('gallery', email);
                    },
                  ),
                  GestureDetector(
                    child: MycustomBtn(
                        Colors.green, Icons.how_to_reg, 'Add a Hostel'),
                    onTap: () {
                      Future.delayed(const Duration(milliseconds: 5000), () {
                        addHostelFromDashboard(
                            email,
                            h_Name.text,
                            HO_Facility.text,
                            neraby_clg.text,
                            HO_rent.text,
                            HO_rent_cycles.text,
                            HO_avil_rooms.text,
                            tphoto);

                        Fluttertoast.showToast(
                            msg: "Hostel Added Succesfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => HostelDashboard(email)),
                            (Route<dynamic> route) => false);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
        BoxShadow(offset: Offset.zero, blurRadius: 1, color: Colors.white)
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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

Widget myTextInput(
    String hintText, TextEditingController controller, obsureText) {
  return TextField(
    obscureText: obsureText,
    controller: controller,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.indigoAccent, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        fillColor: Color.fromARGB(255, 87, 47, 103)),
  );
}
