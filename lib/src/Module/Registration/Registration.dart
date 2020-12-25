import 'package:Homies/src/Module/Login/Login.dart';
import 'package:Homies/src/Module/Logo/Logo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Homies/src/utils/network_dio/validators.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();
void main() {
  runApp(MaterialApp());
}

class Registration extends StatefulWidget {
  final String title = 'Registration';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  // String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail,
      _fname,
      _mname,
      _lname,
      _password,
      _houseid,
      _address,
      _contact,
      _confpassword;
      // _usertype = "Resident Owner";

  // SharedPreferences pr = await SharedPreferences.getInstance();
  // uid = pr.getString('uid');

  // final GlobalKey<FormState> _registrationFormKey = GlobalKey<FormState>();
  bool _obscureText = true;
  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _register() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _userEmail,
      password: _password,
    ))
        .user;
    String _uid = user.uid;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
    dbref.child('Homies').child('Secretary').set({
      "first_name": _fname,
      "middle_name": _mname,
      "last_name": _lname,
      "email": _userEmail,
      "contact": _contact,
      "House No.": _houseid,
      "address": _address,
      "password": _password,
      "confpassword": _confpassword,
      // "type": _usertype,
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  cursorHeight: 25,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'First Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  validator: (value) => Validators.validateUser(value),
                  onSaved: (value) => _fname = value.trim(),
                  onChanged: (value) => _fname = value.trim(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorHeight: 25,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Middle Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  // validator: (value) => Validators.validateUser(value),
                  onSaved: (value) => _mname = value.trim(),
                  onChanged: (value) => _mname = value.trim(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorHeight: 25,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Last Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  validator: (value) => Validators.validateUser(value),
                  onSaved: (value) => _lname = value.trim(),
                  onChanged: (value) => _lname = value.trim(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    TextFormField(
                      cursorHeight: 25,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'House No.',
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'please enter your house no';
                        }
                        return null;
                      },
                      onSaved: (value) => _houseid = value.trim(),
                      onChanged: (value) => _houseid = value.trim(),
                    ),

                    TextFormField(
                      cursorHeight: 25,
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
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'please enter your Address';
                        }
                        return null;
                      },
                      onSaved: (value) => _address = value.trim(),
                      onChanged: (value) => _address = value.trim(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorHeight: 25,
                  keyboardType: TextInputType.phone,
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
                  validator: (value) => Validators.validatePhone(value),
                  onSaved: (value) => _contact = value.trim(),
                  onChanged: (value) => _contact = value.trim(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorHeight: 25,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
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
                  validator: (value) => Validators.validateEmail(value),
                  onSaved: (value) => _userEmail = value.trim(),
                  onChanged: (value) => _userEmail = value.trim(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: _obscureText,
                  cursorHeight: 25,
                  controller: _passwordController,
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
                  validator: (value) => Validators.validatePassword(value),
                  onSaved: (value) => _password = value.trim(),
                  onChanged: (value) => _password = value.trim(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: _obscureText,
                  cursorHeight: 25,
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
                  validator: (value) => Validators.validatePassword(value),
                  onSaved: (value) => _confpassword = value.trim(),
                  onChanged: (value) => _confpassword = value.trim(),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                // DropdownButton<String>(
                //   value: _usertype,
                //   icon: Icon(Icons.arrow_downward),
                //   iconSize: 22,
                //   iconEnabledColor: Colors.white,
                //   style: TextStyle(color: Colors.black),
                //   underline: Container(
                //     height: 1,
                //     color: Colors.black,
                //   ),
                //   onChanged: (String newValue) {
                //     setState(() {
                //       _usertype = newValue;
                //     });
                //   },
                //   items: <String>[
                //     'Secretary',
                //     'Resident Owner',
                //   ].map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // ),
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
             
                  onPressed: () async {
                    print(_userEmail);
                    print(_password);

                    _register();
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(_success == null
                      ? ''
                      : (_success
                          ? 'Successfully registered ' + _userEmail
                          : 'Registration failed')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
