import 'package:flutter/material.dart';
import 'package:Homies/src/Secretary_Drawer/add_watchman.dart';
import 'package:Homies/src/Secretary_Drawer/addmaidstaff.dart';
import 'package:Homies/src/Secretary_Drawer/viewbooking.dart';
class SecretaryService extends StatefulWidget {
  @override
  _SecretaryServiceState createState() => _SecretaryServiceState();
}

class _SecretaryServiceState extends State<SecretaryService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.black,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Service",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(
                      height: 180,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _buildVehical(),
                        _buildAddBooking(),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildWatchmanDetails(),
                _buildMaidStaff(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildVehical() {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 150,
        width: 150,
        child: Card(
          color: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(45),
            child: Column(
              children: <Widget>[
                Icon(Icons.bike_scooter),
                Text("Vehical"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddBooking() {
    return InkWell(
      onTap: () {
         Navigator.push(context, MaterialPageRoute(builder:(context)=>BookingDetails(),),);
      },
      child: SizedBox(
        height: 150,
        width: 150,
        child: Card(
          color: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 45, 20, 0),
            child: Column(
              children: <Widget>[
                Icon(Icons.add),
                Text("Booking Details"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWatchmanDetails() {
    return InkWell(
      onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>AddWatchman(),),);
            },
      child: SizedBox(
        height: 150,
        width: 150,
        child: Card(
          color: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 45, 20, 0),
            child: Column(
              children: <Widget>[
                Icon(Icons.person_add),
                Text("      Add \n Watchman"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMaidStaff() {
    return InkWell(
     onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>AddMaidStaff(),),);
            },
      child: SizedBox(
        height: 150,
        width: 150,
        child: Card(
          color: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 45, 20, 0),
            child: Column(
              children: <Widget>[
                Icon(Icons.person_add_alt_1_sharp),
                Text("       Add \n Maid Staff"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
