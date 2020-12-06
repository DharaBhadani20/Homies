
import 'package:Homies/src/Module/Login/Login.dart';
import 'package:Homies/src/Module/Logo/Logo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp());
}

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  bool _obscureText = true;
  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Logo(),
              Text(
                'Reset Your Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: _obscureText,
                // cursorHeight: 25,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: ' Enter New Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  suffixIcon: InkWell(
                    onTap: _togglePasswordStatus,
                    child: Icon(
                      _obscureText
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: _obscureText,
                // cursorHeight: 25,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: 'Re-Enter New Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  suffixIcon: InkWell(
                    onTap: _togglePasswordStatus,
                    child: Icon(
                      _obscureText
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
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
                    MaterialPageRoute(builder: (context) => Login()),
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
      ),
    );
  }
}
