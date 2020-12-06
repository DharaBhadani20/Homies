import 'package:Homies/src/Module/Logo/Logo.dart';
import 'package:flutter/material.dart';

import 'ConfirmationCode.dart';

void main() {
  runApp(MaterialApp());
}

class Forgot extends StatefulWidget {
  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: <Widget>[
            Logo(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Forgot Password ?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
              'Enter Your Contact No.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              // cursorHeight: 25,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Colors.grey)),
                hintText: 'Contact No.',
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 40,
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
                  MaterialPageRoute(builder: (context) => Confirmation()),
                );
              },
              child: Text(
                'Next',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
