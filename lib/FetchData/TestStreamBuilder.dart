import 'package:flutter/material.dart';
import 'package:my_mega_project/FetchData/UsingStreams.dart';
import 'package:my_mega_project/Models/Hostel.dart';

class TestStreamBuilder extends StatelessWidget {
  Hostel publichostel = new Hostel(
      HO_Name: 'HO_Name',
      HO_Email: 'HO_Email',
      HO_addr: 'HO_addr',
      HO_nearby_clg: 'HO_nearby_clg',
      HO_Facility: 'HO_Facility',
      HO_Rent: 'HO_Rent',
      HO_RentCycle: 'HO_RentCycle',
      HO_Avail_Rooms: 'HO_Avail_Rooms',
      HO_CnNo: 'cn');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Hostel>(
        stream: DataFetchServices().HostelData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Hostel hostel = snapshot.data as Hostel;
            publichostel = hostel;
            return Container();
          } else {
            return Container();
          }
        });
  }
}
