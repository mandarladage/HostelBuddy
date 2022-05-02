import 'package:flutter/material.dart';
import 'package:my_mega_project/methods/UploadData/Upload_Methods_Hostel.dart';
import 'package:my_mega_project/screens/loginscreens/HostelLogin.dart';
import 'package:my_mega_project/screens/loginscreens/Login_Widget.dart';

class HostelRegistration extends StatelessWidget {
  final u_fName = TextEditingController();
  final u_lName = TextEditingController();
  final u_Email = TextEditingController();
  final u_Password = TextEditingController();
  final u_Address = TextEditingController();
  final u_Phone = TextEditingController();

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
                  myTextInput('FirstName', u_fName, false),
                  myTextInput('LastName', u_lName, false),
                  myTextInput('Email', u_Email, false),
                  myTextInput('Password', u_Password, true),
                  myTextInput('Address', u_Address, false),
                  myTextInput('Contact Number', u_Phone, false),
                  GestureDetector(
                    child:
                        MycustomBtn(Colors.green, Icons.how_to_reg, 'Sign Up'),
                    onTap: () {
                      registerHostelUser(
                          u_fName.text,
                          u_lName.text,
                          u_Email.text,
                          u_Password.text,
                          u_Address.text,
                          u_Phone.text);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => HostelLogin()),
                          (Route<dynamic> route) => false);
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => HostelLogin()),
                          (Route<dynamic> route) => false);
                    },
                    child: Text(
                      "Already Have Account Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    u_fName.dispose();
    u_lName.dispose();
    u_Email.dispose();
    u_Phone.dispose();
    u_Address.dispose();
    u_Password.dispose();
    //super.dispose();
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
