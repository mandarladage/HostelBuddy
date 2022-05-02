import 'package:flutter/material.dart';
import 'package:my_mega_project/Shared/Shared.dart';
import 'package:my_mega_project/screens/dashboards/HostelDashboard.dart';

class AddStudentInfoToHostel extends StatefulWidget {
  @override
  _AddStudentInfoToHostelState createState() => _AddStudentInfoToHostelState();
}

class _AddStudentInfoToHostelState extends State<AddStudentInfoToHostel> {
  final stuName = TextEditingController(text: '');

  final stuRoom = TextEditingController(text: '');

  final stuRent = TextEditingController(text: '');

  final stuId = TextEditingController(text: '');

  final stuContactNumber = TextEditingController(text: '');

  final stuAddress = TextEditingController(text: '');

  final stuDocSubmitted = TextEditingController(text: '');

  String? dropdownValue;

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
            color: Color(0xff8e18d2),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Form(
                key: _sigInFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                        autofocus: true,
                        controller: stuName,
                        decoration: inputTextDecoration.copyWith(
                            hintText: 'Room Number'),
                        onChanged: (val) {
                          setState(() {
                            //updatedHostelName = val;
                          });
                        }),
                    DropdownButton(
                      value: "Tokyo",
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                            child: Text("New York"), value: "New York"),
                        DropdownMenuItem(
                          child: Text("Tokyo"),
                          value: "Tokyo",
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          dropdownValue = value.toString();
                        });
                      },
                    ),
                    TextFormField(
                      autofocus: true,
                      controller: stuRoom,
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
                        controller: stuName,
                        decoration: inputTextDecoration.copyWith(
                            hintText: 'Students Already Booked'),
                        onChanged: (val) {
                          setState(() {
                            //updatedHoNearbyClg = val;
                          });
                        }),
                    TextFormField(
                        autofocus:
                            true, //this is for test that we can make it happen together
                        controller: stuAddress,
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
                        controller: stuContactNumber,
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
