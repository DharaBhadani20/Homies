import 'package:Homies/src/User_Home/Maintenance/Make_Payment.dart';
import 'package:flutter/material.dart';

class GiveFeedback extends StatefulWidget {
  @override
  _GiveFeedbackState createState() => _GiveFeedbackState();
}

class _GiveFeedbackState extends State<GiveFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Feed Back"),
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
              "Feed Back",
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
                hintText: "Feedback Topic",
              ),
            ),
            SizedBox(
              height: 20,
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
                hintText: "Description",
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
                "Save",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
