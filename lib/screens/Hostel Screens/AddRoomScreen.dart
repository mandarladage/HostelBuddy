import 'package:flutter/material.dart';
import 'package:my_mega_project/Shared/Shared.dart';
import 'package:my_mega_project/screens/dashboards/HostelDashboard.dart';

class AddRoomScreen extends StatefulWidget {
  @override
  _AddRoomScreenState createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  final roomNu = TextEditingController(text: HostelDashboard.HO_Name);

  final roomCapacity = TextEditingController(text: HostelDashboard.HO_Facility);

  final rentPerStudent =
      TextEditingController(text: HostelDashboard.HO_nearby_clg);

  final roomBookedCount =
      TextEditingController(text: HostelDashboard.HO_avil_rooms);

  final roomAvailCount = TextEditingController(text: HostelDashboard.HO_rent);

  final roomRentCycle =
      TextEditingController(text: HostelDashboard.HO_rent_cycles);

  late String name;

  final _sigInFormKey = GlobalKey<FormState>();

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
                    TextFormField(
                        autofocus: true,
                        controller: roomNu,
                        decoration: inputTextDecoration.copyWith(
                            hintText: 'Room Number'),
                        onChanged: (val) {
                          setState(() {
                            //updatedHostelName = val;
                          });
                        }),
                    TextFormField(
                      autofocus: true,
                      controller: roomCapacity,
                      decoration:
                          inputTextDecoration.copyWith(hintText: 'Capacity'),
                      onChanged: (val) {
                        setState(() {
                          //updatedHoFacility = val;
                        });
                      },
                    ),
                    TextFormField(
                        autofocus: true,
                        controller: roomBookedCount,
                        decoration: inputTextDecoration.copyWith(
                            hintText: 'Students Already Booked'),
                        onChanged: (val) {
                          setState(() {
                            //updatedHoNearbyClg = val;
                          });
                        }),
                    TextFormField(
                        autofocus: true,
                        controller: roomAvailCount,
                        decoration: inputTextDecoration.copyWith(
                            hintText: 'Remaining Seats'),
                        onChanged: (val) {
                          setState(() {
                            //updatedHoRent = val;
                          });
                        },
                        validator: (val) {
                          if (!isNumeric(val!)) {
                            return 'Only Number are allowed';
                          }
                        }),
                    TextFormField(
                        autofocus: true,
                        controller: roomRentCycle,
                        decoration: inputTextDecoration.copyWith(
                            hintText: 'Rent Cycle'),
                        onChanged: (val) {
                          setState(() {
                            // updatedHoRentCycle = val;
                          });
                        }),
                    GestureDetector(
                      child:
                          MycustomBtn(Colors.green, Icons.how_to_reg, 'Update'),
                      onTap: () {
                        if (_sigInFormKey.currentState!.validate()) {
                          Future.delayed(const Duration(milliseconds: 1000),
                              () {
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

bool isNumeric(String str) {
  RegExp _numeric = RegExp(r'^-?[0-9]+$');
  return _numeric.hasMatch(str);
}
