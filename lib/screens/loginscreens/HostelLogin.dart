import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_mega_project/methods/UploadData/Upload_Methods_Hostel.dart';
import 'package:my_mega_project/screens/dashboards/HostelDashboard.dart';
import 'package:my_mega_project/screens/loginscreens/HostelRegistration.dart';
import 'package:my_mega_project/screens/loginscreens/UpdateHostelInfo.dart';

class HostelLogin extends StatelessWidget {
  final u_Email = TextEditingController();
  final u_Password = TextEditingController();
  Future<bool>? isCorrect;
  CollectionReference hostels = FirebaseFirestore.instance.collection('Hostel');

  @override
  Widget build(BuildContext context) {
    double actualWidth = MediaQuery.of(context).size.width;
    double actualHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Color(0xFF5a0f86),
      child: Center(
        child: SizedBox(
          width: actualWidth * 0.75,
          height: actualHeight * 0.75,
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
                    size: 200,
                    color: Colors.white,
                  ),
                  myTextInput('Email', u_Email, false),
                  myTextInput('Password', u_Password, true),
                  GestureDetector(
                    child: MycustomBtn(Colors.deepPurple, Icons.login, 'Login'),
                    onTap: () async {
                      DocumentSnapshot documentSnapshot =
                          await hostels.doc(u_Email.text).get();
                      var Temp =
                          documentSnapshot.data() as Map<String, dynamic>;
                      if (Temp['HO_email'].toString() == u_Email.text &&
                          Temp['HO_password'].toString() == u_Password.text) {
                        print("It os True");
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    HostelDashboard(u_Email.text)),
                            (Route<dynamic> route) => false);
                      } else {
                        print("It os False");
                        u_Email.clear();
                        u_Password.clear();
                      }
                      // isCorrect = loginHostel(u_Email.text, u_Password.text);
                      // print("Value of iscorrect ----> $isCorrect");
                      // isCorrect!.whenComplete(() {
                      //   if (isCorrect.toString() != null && isCorrect == true) {
                      //     Navigator.of(context).pushAndRemoveUntil(
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                 const HostelDashboard()),
                      //         (Route<dynamic> route) => false);
                      //   } else {
                      //     Container(
                      //       child: Center(child: Text("Something Went Wrong")),
                      //     );
                      //   }
                      // });
                      // print(isCorrect.toString());
                      // Navigator.of(context).pushAndRemoveUntil(
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             );
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => HostelRegistration()),
                          (Route<dynamic> route) => false);
                    },
                    child: Text(
                      "Don't Have Account? Register",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
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
