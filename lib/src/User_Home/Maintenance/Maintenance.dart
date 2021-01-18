// import 'package:Homies/src/User_Home/Maintenance/Make_Payment.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:Homies/src/User_Home/Maintenance/Make_Payment.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

class MaintenanceScreen extends StatefulWidget {
  @override
  _MaintenanceScreenState createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  String _payment;
  @override
  Widget build(BuildContext context) {
    dbref
        .child("payment")
        .child("Payment")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _payment = snapshot.value;
        print(_payment);
      });
    });
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Maintenance Service"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
          top: 20,
        ),
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          boxShadow: [
            BoxShadow(blurRadius: 7.0, color: Colors.white.withOpacity(1)),
          ],
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),

              Text(
                "Monthly Maintenance",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "The maintenance you have to pay",
                style: TextStyle(fontSize: 23),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35)),
                  child: Center(
                    child: Text(
                      _payment,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(height:30),
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
                  "MAKE A PAYMENT",
                ),
              ),
              SizedBox(
                height: 200,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.05,
                child: WaveWidget(
                  config: CustomConfig(
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.grey.withOpacity(0.2),
                      Colors.black.withOpacity(0.1),
                    ],
                    durations: [4000, 5000, 7000],
                    heightPercentages: [0.01, 0.05, 0.03],
                    blur: MaskFilter.blur(BlurStyle.solid, 5),
                  ),
                  waveAmplitude: 40.00,
                  waveFrequency: 3,
                  backgroundColor: Colors.grey[100],
                  size: Size(double.maxFinite, double.minPositive),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
