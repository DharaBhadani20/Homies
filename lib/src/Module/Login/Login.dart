import 'package:Homies/src/Module/ForgotPassword/ForgotPassword.dart';
import 'package:Homies/src/Module/LoginWithPhone/PhoneLogin.dart';
import 'package:Homies/src/Module/Logo/Logo.dart';
import 'package:Homies/src/Module/Registration/Registration.dart';
import 'package:Homies/src/User_Drawer/User_Drawer.dart';
// import 'package:Homies/src/rootpage.dart';
// import 'package:SocietyManagementSystem/src/User_Home/Home.dart';
import 'package:Homies/src/utils/network_dio/validators.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Homies/src/authentication.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:Homies/src/Model/todo.dart';

class Login extends StatefulWidget {
  Login({Key key,this.auth,this.userId, this.loginCallback,this.logoutCallback}) : super(key: key);
  
   final BaseAuth auth;
  final VoidCallback loginCallback;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    final _formKey = new GlobalKey<FormState>();

  String _email, _password;
  String _errorMessage;

  // final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  int _value = 0;

  bool _obscureText = true;

  bool _isLoginForm;
  bool _isLoading;

  // Check if form is valid before perform login or signup
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void validateAndSubmit() async {
  
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

 @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }


  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // Future<void> login() async {
  //   final formState = _loginFormKey.currentState;
  //   if (formState.validate()) {
  //     formState.save();
  //     try {
  //       FirebaseUser user = await FirebaseAuth.instance
  //           .signInWithEmailAndPassword(email: _email, password: _password);
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => Home(user: user),
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
            key: _formKey,
            child: Column(
              children: <Widget>[
                Logo(),
                Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  cursorHeight: 25,
                  cursorColor: Colors.grey,
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
                  onSaved: (value) => _email = value.trim(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: _obscureText,
                  // cursorHeight: 25,
                  cursorColor: Colors.grey,
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        flex: 0,
                        child: Radio(
                          activeColor: Colors.grey,
                          focusColor: Colors.grey,
                          value: 1,
                          groupValue: _value,
                          onChanged: (int value) {
                            setState(
                              () {
                                _value = value;
                              },
                            );
                          },
                        )),
                    Expanded(flex: 2, child: Text('Remember Me')),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Forgot()),
                          );
                        },
                        child: Text('Forgot Password?'),
                      ),
                    ),
                  ],
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
                  onPressed: () {
                    validateAndSubmit();
                  // final String cuid = UserCredential.user.uid;
                  // print(cuid);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => UserDrawer()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'or login with',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Container(
                    padding: EdgeInsets.only(right: 10, bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black)),
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Phone()),
                        );
                      },
                      icon: Icon(
                        Icons.phone,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Registration()));
                      },
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                            color: Colors.green.shade500,
                            fontSize: 20,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
