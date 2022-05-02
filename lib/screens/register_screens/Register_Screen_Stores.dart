import 'package:flutter/material.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';
import 'package:getwidget/getwidget.dart';
import 'package:my_mega_project/methods/UploadData/Upload_Methods_Store.dart';

class Register_Screen_Store extends StatelessWidget {
  final myS_fName = TextEditingController();
  final myS_lName = TextEditingController();
  final myS_cnNo = TextEditingController();
  final myS_email = TextEditingController();
  final myS_addr = TextEditingController();
  final myS_sName = TextEditingController();
  final myS_nbClg = TextEditingController();
  final myS_city = TextEditingController();
  final myS_district = TextEditingController();

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
                                label: "Firstname", textController: myS_fName),
                            makeInput(
                                label: "Lastname", textController: myS_lName),
                            makeInput(
                                label: "Contact Number",
                                textController: myS_cnNo),
                            makeInput(
                                label: "Email", textController: myS_email),
                            makeInput(
                                label: "Address", textController: myS_addr),
                            makeInput(
                                label: "Store Name", textController: myS_sName),
                            makeInput(
                                label: "Nearby College",
                                textController: myS_nbClg),
                            makeInput(label: "City", textController: myS_city),
                            makeInput(
                                label: "District",
                                textController: myS_district),
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
                              addStoreUserCollection(
                                myS_fName.text,
                                myS_lName.text,
                                myS_cnNo.text,
                                myS_email.text,
                                myS_addr.text,
                                myS_sName.text,
                                myS_nbClg.text,
                                myS_city.text,
                                myS_district.text,
                              );
                              addStorePhotosCollection(myS_email.text, "", "");
                            },
                            text: "SignUp as Store",
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

// void clearScreen( TextEditingController t1,TextEditingController t2,TextEditingController 3,t4,t5,t6,t7,t8,t9) {
//   t1.clear();
// }

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
