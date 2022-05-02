import 'package:flutter/material.dart';
import 'package:my_mega_project/Shared/Shared.dart';
import 'package:my_mega_project/methods/UploadData/Upload_Methods_Hostel.dart';
import 'package:my_mega_project/screens/dashboards/HostelDashboard.dart';

class ToUpdateHostel extends StatefulWidget {
  final String email;

  ToUpdateHostel(this.email);

  @override
  State<ToUpdateHostel> createState() => _ToUpdateHostelState();
}

class _ToUpdateHostelState extends State<ToUpdateHostel> {
  final h_Name = TextEditingController(text: HostelDashboard.HO_Name);

  final HO_Facility = TextEditingController(text: HostelDashboard.HO_Facility);

  final HO_nearby_clg =
      TextEditingController(text: HostelDashboard.HO_nearby_clg);

  final HO_avil_rooms =
      TextEditingController(text: HostelDashboard.HO_avil_rooms);

  final HO_rent = TextEditingController(text: HostelDashboard.HO_rent);

  final HO_rent_cycles =
      TextEditingController(text: HostelDashboard.HO_rent_cycles);

  late String name;

  final _sigInFormKey = GlobalKey<FormState>();

  String? updatedHostelName;
  String? updatedHoFacility;
  String? updatedHoNearbyClg;
  String? updatedHoRent;
  String? updatedHoRentCycle;
  String? updatedHoAvailRooms;

  @override
  Widget build(BuildContext context) {
    double actualWidth = MediaQuery.of(context).size.width;
    double actualHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white12,
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
              child: Form(
                key: _sigInFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ImageIcon(
                      AssetImage('assets/images/logo2.png'),
                      size: 100,
                      color: Colors.white,
                    ),
                    TextFormField(
                        autofocus: true,
                        controller: h_Name,
                        decoration: inputTextDecoration.copyWith(
                            hintText: 'Hostel Name'),
                        onChanged: (val) {
                          setState(() {
                            updatedHostelName = val;
                          });
                        }),
                    TextFormField(
                      autofocus: true,
                      controller: HO_Facility,
                      decoration:
                          inputTextDecoration.copyWith(hintText: 'Facility'),
                      onChanged: (val) {
                        setState(() {
                          updatedHoFacility = val;
                        });
                      },
                    ),
                    TextFormField(
                        autofocus: true,
                        controller: HO_nearby_clg,
                        decoration: inputTextDecoration.copyWith(
                            hintText: 'Nearby College'),
                        onChanged: (val) {
                          setState(() {
                            updatedHoNearbyClg = val;
                          });
                        }),
                    TextFormField(
                        autofocus: true,
                        controller: HO_rent,
                        decoration:
                            inputTextDecoration.copyWith(hintText: 'Rent'),
                        onChanged: (val) {
                          setState(() {
                            updatedHoRent = val;
                          });
                        },
                        validator: (val) {
                          if (!isNumeric(val!)) {
                            return 'Only Number are allowed';
                          }
                        }),
                    TextFormField(
                        autofocus: true,
                        controller: HO_rent_cycles,
                        decoration: inputTextDecoration.copyWith(
                            hintText: 'Rent Cycle'),
                        onChanged: (val) {
                          setState(() {
                            updatedHoRentCycle = val;
                          });
                        }),
                    TextFormField(
                        autofocus: true,
                        controller: HO_avil_rooms,
                        decoration: inputTextDecoration.copyWith(
                            hintText: 'Available Rooms'),
                        onChanged: (val) {
                          setState(() {
                            updatedHoAvailRooms = val;
                          });
                        },
                        validator: (val) {
                          if (!isNumeric(val!)) {
                            return 'Only Number are allowed';
                          }
                        }),
                    GestureDetector(
                      child:
                          MycustomBtn(Colors.green, Icons.how_to_reg, 'Update'),
                      onTap: () {
                        if (_sigInFormKey.currentState!.validate()) {
                          Future.delayed(const Duration(milliseconds: 1000),
                              () {
                            updateUserHostelData(
                              widget.email,
                              h_Name.text,
                              HO_Facility.text,
                              HO_nearby_clg.text,
                              HO_rent.text,
                              HO_rent_cycles.text,
                              HO_avil_rooms.text,
                            );

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => HostelDashboard(
                                        HostelDashboard.userEmail)),
                                (Route<dynamic> route) => false);
                          });
                          // use the email provided here
                        }
                      },
                    ),
                  ],
                ),
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

Widget myTextInput(String hintText, TextEditingController controller,
    obsureText, String Value) {
  return TextFormField(
    onChanged: (text) {},
    obscureText: obsureText,
    controller: controller..text = Value,
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

/// check if the string contains only numbers
bool isNumeric(String str) {
  RegExp _numeric = RegExp(r'^-?[0-9]+$');
  return _numeric.hasMatch(str);
}
