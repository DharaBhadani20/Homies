import 'package:Homies/src/Module/Logo/Logo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:pinput/pin_put/pin_put.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() {
  runApp(MaterialApp());
}

class OTP extends StatefulWidget {
  
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  String _verificationId;
  String _smsController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(30.0),
    );
  }

void showSnackbar(String message) {
  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
}

  void signInWithPhoneNumber() async {
  
  try {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: _smsController,
    );

    final User user = (await _auth.signInWithCredential(credential)).user;

    showSnackbar("Successfully signed in UID: ${user.uid}");
  } catch (e) {
    showSnackbar("Failed to sign in: " + e.toString());
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: <Widget>[
            Logo(),
            Text(
              'Enter Confirmation Code',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Enter 4-digit code sent to your Number',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 200,
              child: PinPut(
                fieldsCount: 4,
                textStyle: TextStyle(color: Colors.grey),
                pinAnimationType: PinAnimationType.fade,
                submittedFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(30),
                ),
                selectedFieldDecoration: _pinPutDecoration,
                followingFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(30),
                    border:
                        Border.all(color: Colors.grey[900].withOpacity(.4))),
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
              // onPressed: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => Home()),
              //   );
              // },
               onPressed: () async {
        signInWithPhoneNumber();
      },
              child: Text(
                'Next',
                style: TextStyle(fontSize: 22),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  'Resend Code',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
