import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  int duration = 0;
  late Widget goToPage;

  SplashScreen(this.duration, this.goToPage);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      //To do push and remove all widgets before it
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => this.goToPage),
          (Route<dynamic> route) => false);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => this.goToPage));
    });

    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 87, 47, 103), //Colors.indigoAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage('assets/images/splash-logo.png'),
                size: 400,
                color: Colors.white,
              ),
              // Text(
              //   'Hostel Buddy',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
