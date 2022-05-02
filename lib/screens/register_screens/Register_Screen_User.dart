import 'package:flutter/material.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';
import 'package:getwidget/getwidget.dart';
import 'package:my_mega_project/methods/UploadData/Upload_Methods_User.dart';

class Register_Screen_User extends StatelessWidget {
  final myU_fName = TextEditingController();
  final myU_lName = TextEditingController();
  final myU_cnNo = TextEditingController();
  final myU_email = TextEditingController();
  final myU_addr = TextEditingController();
  final myU_city = TextEditingController();
  final myU_district = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FocusWatcher(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // resizeToAvoidBottomPadding: false,
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
          child: Stack(children: [
            Container(
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
                                  label: "Firstname",
                                  textController: myU_fName),
                              makeInput(
                                  label: "Lastname", textController: myU_lName),
                              makeInput(
                                  label: "Contact Number",
                                  textController: myU_cnNo),
                              makeInput(
                                  label: "Email", textController: myU_email),
                              makeInput(
                                  label: "Address", textController: myU_addr),
                              makeInput(
                                  label: "City", textController: myU_city),
                              makeInput(
                                  label: "District",
                                  textController: myU_district),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: GFButton(
                              onPressed: () {
                                addNormalUser(
                                  myU_fName.text,
                                  myU_lName.text,
                                  myU_cnNo.text,
                                  myU_email.text,
                                  myU_addr.text,
                                  myU_city.text,
                                  myU_district.text,
                                );
                                addUserPhotosCollection(myU_email.text, "", "");
                                addUserDocCollection(
                                    myU_email.text,
                                    "AdmissionNotice",
                                    "doc_ui123456789",
                                    "20-Jan-2021");
                                Navigator.pop(context);
                              },
                              text: "SignUp as User",
                              textStyle: TextStyle(
                                fontSize: 20,
                              ),
                              color: Colors.indigoAccent,
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
          ]),
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
