import 'package:flutter/material.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';
import 'package:getwidget/getwidget.dart';
import 'package:my_mega_project/methods/UploadData/Upload_Methods_Mess.dart';

class Register_Screen_Mess extends StatelessWidget {
  final myM_fName = TextEditingController();
  final myM_lName = TextEditingController();
  final myM_cnNo = TextEditingController();
  final myM_email = TextEditingController();
  final myM_addr = TextEditingController();
  final myM_mName = TextEditingController();
  final myM_nbClg = TextEditingController();
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
                                  textController: myM_fName),
                              makeInput(
                                  label: "Lastname", textController: myM_lName),
                              makeInput(
                                  label: "Contact Number",
                                  textController: myM_cnNo),
                              makeInput(
                                  label: "Email", textController: myM_email),
                              makeInput(
                                  label: "Address", textController: myM_addr),
                              makeInput(
                                  label: "Mess Name",
                                  textController: myM_mName),
                              makeInput(
                                  label: "Nearby College",
                                  textController: myM_nbClg),
                              // makeInput(label: "Password", obsureText: true),
                              // makeInput(label: "Confirm Pasword", obsureText: true)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: GFButton(
                              onPressed: () {
                                addMessUserCollection(
                                  myM_fName.text,
                                  myM_lName.text,
                                  myM_cnNo.text,
                                  myM_email.text,
                                  myM_addr.text,
                                  myM_mName.text,
                                  myM_nbClg.text,
                                );
                                addMessUserPhotosCollection(
                                    myM_email.text, "", "");
                                addMessUserPlatesCollection(myM_email.text,
                                    "2 Bhakri,Bhaji,Bhat", "50/day");
                                Navigator.pop(context);
                              },
                              text: "SignUp for Mess",
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
