import 'package:Homies/src/Module/Logo/Logo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp());
}

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  // String _email, _password;
  final GlobalKey<FormState> _registrationFormKey = GlobalKey<FormState>();
  bool _obscureText = true;
  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // void registration() async {
  //   if (_registrationFormKey.currentState.validate()) {
  //     _registrationFormKey.currentState.save();
  //     try {
  //       FirebaseUser user = await FirebaseAuth.instance
  //           .createUserWithEmailAndPassword(email: _email, password: _password);
  //       user.sendEmailVerification();
  //       Navigator.of(context).pop();
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => Login(),
  //         ),
  //       );
  //     } catch (e) {
  //       print(e.message);
  //       // AlertDialog(
  //       //   title: Text("Please Regisater"),
  //       // );
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Form(
            key: _registrationFormKey,
            child: Column(
              children: [
                Logo(),
                Text(
                  'Registration',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 20,
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
                    hintText: 'Full Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // cursorHeight: 25,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Address',
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // cursorHeight: 25,
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
                  height: 20,
                ),
                TextFormField(
                  // cursorHeight: 25,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Email',
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: Colors.grey,
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
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Password',
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
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Confirmed Password',
                    prefixIcon: Icon(
                      Icons.lock_open,
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
                FlatButton(
                  padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(width: 1),
                  ),
                  color: Colors.grey[400],
                  onPressed: () {},
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
