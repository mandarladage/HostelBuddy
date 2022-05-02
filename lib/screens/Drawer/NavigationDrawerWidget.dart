import 'package:flutter/material.dart';
import 'package:my_mega_project/screens/dashboards/HostelDashboard.dart';
import 'package:my_mega_project/screens/loginscreens/ToUpdateHostel.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20, vertical: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xFF5a0f86),
        child: Container(
          padding: padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildHeader(
                  urlImage:
                      'https://www.jeancoutu.com/globalassets/revamp/photo/conseils-photo/20160302-01-reseaux-sociaux-profil/photo-profil_301783868.jpg',
                  name: 'Mandar Ladage',
                  email: 'manadarladage@gmail.com'),
              buildMenuItem(
                  text: 'Profile',
                  icon: Icons.supervised_user_circle,
                  onClicked: () => selectedItem(context, 0)),
              buildMenuItem(
                  text: 'Edit Hostel',
                  icon: Icons.edit,
                  onClicked: () => selectedItem(context, 1)),
              buildMenuItem(
                  text: 'Rooms',
                  icon: Icons.meeting_room,
                  onClicked: () => selectedItem(context, 2)),
              buildMenuItem(
                  text: 'StudentInfo',
                  icon: Icons.emoji_people,
                  onClicked: () => selectedItem(context, 3)),
              buildMenuItem(
                  text: 'Pending Rent',
                  icon: Icons.account_balance_wallet_outlined,
                  onClicked: () => selectedItem(context, 4)),
              Divider(thickness: 2, color: Colors.white70),
              buildMenuItem(
                  text: 'About Us',
                  icon: Icons.info,
                  onClicked: () => selectedItem(context, 5)),
              buildMenuItem(
                  text: 'Contact Us',
                  icon: Icons.call,
                  onClicked: () => selectedItem(context, 6)),
              buildMenuItem(
                  text: 'Logout',
                  icon: Icons.logout,
                  onClicked: () => selectedItem(context, 7)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildMenuItem(
    {required String text, required IconData icon, VoidCallback? onClicked}) {
  final color = Colors.white;
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(
      text,
      style: TextStyle(color: color),
    ),
    onTap: onClicked,
  );
}

Widget buildHeader({urlImage, name, email}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(urlImage),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 4),
              Text(
                email,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          )
        ],
      ),
      SizedBox(height: 10),
      Divider(thickness: 2, color: Colors.white70),
    ]),
  );
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HostelDashboard(HostelDashboard.userEmail)));
      break;

    case 1:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ToUpdateHostel(HostelDashboard.userEmail)));
      break;

    case 2:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HostelDashboard(HostelDashboard.userEmail)));
      break;

    case 3:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HostelDashboard(HostelDashboard.userEmail)));
      break;

    case 4:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HostelDashboard(HostelDashboard.userEmail)));
      break;

    case 5:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HostelDashboard(HostelDashboard.userEmail)));
      break;

    case 6:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HostelDashboard(HostelDashboard.userEmail)));
      break;
    case 7:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HostelDashboard(HostelDashboard.userEmail)));
      break;
  }
}
