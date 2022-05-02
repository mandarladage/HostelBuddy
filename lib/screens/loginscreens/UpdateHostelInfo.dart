import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_mega_project/methods/UploadData/Upload_Methods_Hostel.dart';

import '../dashboards/HostelDashboard.dart';

class UpdateHostelInfo extends StatelessWidget {
  final u_fName = TextEditingController();
  final u_lName = TextEditingController();
  final u_Address = TextEditingController();
  final u_Phone = TextEditingController();

  String email;

  UpdateHostelInfo(this.email);

  @override
  Widget build(BuildContext context) {
    CollectionReference hostel =
        FirebaseFirestore.instance.collection('Hostel');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5a0f86),
        title: ImageIcon(
          AssetImage('assets/images/logo2.png'),
          size: 100,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF5a0f86),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HostelDashboard(email)),
              (Route<dynamic> route) => false);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 29,
        ),
        backgroundColor: Colors.black,
        tooltip: 'Capture Picture',
        elevation: 5,
        splashColor: Colors.grey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: FutureBuilder<DocumentSnapshot>(
        future: hostel.doc(email).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Center(child: Text("Document does not exist"));
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> myHostel =
                snapshot.data!.data() as Map<String, dynamic>;

            if (snapshot.hasData) {
              if (myHostel['has_hostel'] == "1") {
                myTextInput('FirstName', u_fName, false, myHostel['HO_fName']);
                myTextInput('LastName', u_lName, false, myHostel['HO_lName']);
                myTextInput(
                    'Conatact Number', u_Phone, false, myHostel['HO_cnNo']);
                myTextInput('Address', u_Address, false, myHostel['HO_addr']);
                return GestureDetector(
                  child: MycustomBtn(Colors.green, Icons.how_to_reg, 'Sign Up'),
                  onTap: () {
                    updateUserPersonalData(u_fName.text, u_lName.text, email,
                        u_Address.text, u_Phone.text);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            HostelDashboard(email),
                      ),
                      (route) => false,
                    );
                  },
                );
              } else {
                return Center(
                  child: Text("Please add Hostel"),
                );
              }
            } else {
              return Center(
                child: Text("Please add Hostel"),
              );
            }
          }

          if (snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: Text("Please add Hostel"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: SizedBox(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
              width: 40,
              height: 40,
            ));
          }

          return Center(
              child: SizedBox(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
            width: 40,
            height: 40,
          ));
        },
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
  return TextField(
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
