import 'package:flutter/material.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';
import 'package:getwidget/getwidget.dart';
import 'package:my_mega_project/methods/UploadData/Upload_Methods_Hostel.dart';
import 'package:my_mega_project/screens/Photos_Screens/Add_Photo_For_Profile.dart';

class Register_Screen_Hostel extends StatelessWidget {
  final myH_fName = TextEditingController();
  final myH_lName = TextEditingController();
  final myH_cnNo = TextEditingController();
  final myH_email = TextEditingController();
  final myH_addr = TextEditingController();
  final myH_hName = TextEditingController();
  final myH_nbClg = TextEditingController();
  final myH_rent = TextEditingController();
  final myH_rent_cycle = TextEditingController();
  final myH_avRooms = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FocusWatcher(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              )),
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Create an Account,Its free",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            makeInput(
                                label: "Firstname", textController: myH_fName),
                            makeInput(
                                label: "Lastname", textController: myH_lName),
                            makeInput(
                                label: "Contact Number",
                                textController: myH_cnNo),
                            makeInput(
                                label: "Email", textController: myH_email),
                            makeInput(
                                label: "Address", textController: myH_addr),
                            makeInput(
                                label: "Hostel Name",
                                textController: myH_hName),
                            makeInput(
                                label: "Nearby College",
                                textController: myH_nbClg),
                            makeInput(label: "Rent", textController: myH_rent),
                            makeInput(
                                label: "Rent Cycles",
                                textController: myH_rent_cycle),
                            makeInput(
                                label: "Available Rooms",
                                textController: myH_avRooms),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: GFButton(
                            onPressed: () {
                              addHostelUserCollection(
                                myH_fName.text,
                                myH_lName.text,
                                myH_cnNo.text,
                                myH_email.text,
                                myH_addr.text,
                                myH_hName.text,
                                myH_nbClg.text,
                                myH_rent.text,
                                myH_rent_cycle.text,
                                myH_avRooms.text,
                              );
                              addHostelUserPhotosCollection(
                                  myH_email.text, "", "");
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UploadImageToStorage()),
                                  (Route<dynamic> route) => false);
                            },
                            text: "SignUp as Hostel Owner",
                            textStyle: TextStyle(
                              fontSize: 20,
                            ),
                            color: Colors.redAccent,
                            shape: GFButtonShape.pills,
                            fullWidthButton: true,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? "),
                          Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ],
                      )
                    ],
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

void Dispose(tc) {
  tc.dispose();
}

Widget makeInput({label, obsureText = false, textController}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obsureText,
        controller: textController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
      SizedBox(
        height: 30,
      )
    ],
  );
}
