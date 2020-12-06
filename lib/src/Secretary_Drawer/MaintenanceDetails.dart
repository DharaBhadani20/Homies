import 'package:Homies/src/User_Home/Maintenance/Make_Payment.dart';
import 'package:flutter/material.dart';

class MaintenanceDetails extends StatefulWidget {
  @override
  _MaintenanceDetailsState createState() => _MaintenanceDetailsState();
}

class _MaintenanceDetailsState extends State<MaintenanceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Maintenance Details"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          children: <Widget>[
            Text(
              "Monthly Maintenance",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              cursorColor: Colors.grey,
              // cursorHeight: 25,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey)),
                hintText: "Rs...../-",
              ),
            ),
            SizedBox(
              height: 50,
            ),
            FlatButton(
              padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(width: 1),
              ),
              color: Colors.grey[400],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MakePayment(),
                  ),
                );
              },
              child: Text(
                "SAVE",
              ),
            ),
          ],
        ),
      ),
    );
  }
}