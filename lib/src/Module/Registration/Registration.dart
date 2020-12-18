import 'package:Homies/src/Module/Logo/Logo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Homies/src/utils/network_dio/validators.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

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
String _userEmail;




  // final GlobalKey<FormState> _registrationFormKey = GlobalKey<FormState>();
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

  void _register() async {
  final User user = (await 
      _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )
  ).user;
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
                //    validator: (String value){
                //     if(value.isEmpty)
                //     {
                //       return 'please enter first name';
                //     }
                //     return null;
                //   },
                  validator: (value) => Validators.validateUser(value),

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
                  //  validator: (String value){
                  //   if(value.isEmpty)
                  //   {
                  //     return 'please enter Middle name';
                  //   }
                  //   return null;
                  // },
                  validator: (value) => Validators.validateUser(value),

                  
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

                  //  validator: (String value){
                  //   if(value.isEmpty)
                  //   {
                  //     return 'please enter Last name';
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(
                  height: 20,
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
                   validator: (String value){
                    if(value.isEmpty)
                    {
                      return 'please enter your Address';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
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
                    hintText: 'Contact No.',
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                  ),
                  validator: (value) => Validators.validatePhone(value),

                  //  validator: (String value){
                  //   if(value.isEmpty)
                  //   {
                  //     return 'please enter your phone Number';
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorHeight: 25,
                  controller: _passwordController,
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

                  // validator: (String value){
                  //   if(value.isEmpty)
                  //   {
                  //     return 'enter proper email';
                  //   }
                  //   return null;
                  // },
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

                  //  validator: (String value){
                  //   if(value.isEmpty)
                  //   {
                  //     return 'Please enter password';
                  //   }
                  //   return null;
                  // },
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
                   validator: (String value){
                    if(value.isEmpty)
                    {
                      return 'Please enter confirm password ';
                    }
                    return null;
                  },
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
                  // onPressed: () {},
                  onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _register();
                }
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