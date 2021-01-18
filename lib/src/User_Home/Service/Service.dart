import 'package:Homies/src/User_Home/Service/add_booking.dart';
import 'package:Homies/src/User_Home/Service/maid_staff.dart';
import 'package:Homies/src/User_Home/Service/watchman_details.dart';
import 'package:flutter/material.dart';

class MainServiceScreen extends StatefulWidget {
  @override
  _MainServiceScreenState createState() => _MainServiceScreenState();
}

class _MainServiceScreenState extends State<MainServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
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
                Icon(Icons.pedal_bike),
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddBooking(),
          ),
        );
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
                Text("Add Booking"),
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ViewWatchmanDetails()),
        );
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
                Icon(Icons.person_sharp),
                Text("Watchman\n    Details"),
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MaidDetails(),
          ),
        );
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
                Icon(Icons.person_search_sharp),
                Text("Maid Staff"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
