import 'package:Homies/src/Secretary_Drawer/SecretaryHome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

// import 'package:miniproject/Drawer/Secretary_Drawer.dart';
// import 'package:miniproject/MainScreen/Home.dart';
// import 'package:miniproject/Secretary_Drawer/Date_Piker.dart';
// import 'Date_Piker.dart';
FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

class ArrangeMeeting extends StatefulWidget {
  @override
  _ArrangeMeetingState createState() => _ArrangeMeetingState();
}

class _ArrangeMeetingState extends State<ArrangeMeeting> {
  bool _success;
  String _meetingsubject, _date, _time, _venue, _description;

  DateTime pickedDate;
  TimeOfDay time;
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }

  _pickTime() async {
    TimeOfDay t = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (t != null)
      setState(() {
        time = t;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Meeting',
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        margin: EdgeInsets.only(top: 20, left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(blurRadius: 7.0, color: Colors.white.withOpacity(1)),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    cursorColor: Colors.grey,
                    // cursorHeight: 25,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Meeting Subject',
                      contentPadding:
                          EdgeInsets.only(top: 18, left: 15, bottom: 18),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onSaved: (value) => _meetingsubject = value.trim(),
                    onChanged: (value) => _meetingsubject = value.trim(),
                  )),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  // contentPadding: EdgeInsets.only(top: 0, left: 15, bottom: 0),
                  title: Text(
                    'Date:${pickedDate.day}-${pickedDate.month}-${pickedDate.year}',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  onTap: _pickDate,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  title: Text(
                    'Time:${time.hour}:${time.minute}',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  onTap: _pickTime,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  cursorColor: Colors.grey,
                  // cursorHeight: 25,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Venue',
                    contentPadding:
                        EdgeInsets.only(top: 18, left: 15, bottom: 18),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onSaved: (value) => _venue = value.trim(),
                  onChanged: (value) => _venue = value.trim(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  cursorColor: Colors.grey,
                  // cursorHeight: 25,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Description',
                    contentPadding:
                        EdgeInsets.only(top: 18, left: 15, bottom: 18),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onSaved: (value) => _description = value.trim(),
                  onChanged: (value) => _description = value.trim(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  onPressed: () {
                    _date = pickedDate.toString();
                    _time = time.toString();
                    dbref.child('meeting').set({
                      "subject": _meetingsubject,
                      "Date": _date,
                      "Time": _time,
                      "venue": _venue,
                      "Description": _description,
                    });

                    print(
                        "meeting  $_meetingsubject : $_date : $_time : $_venue : $_description");
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => SecretaryHomePage(uid: null)));
                  },
                  child: Text(
                    'Save',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
