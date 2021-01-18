import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

class AddBooking extends StatefulWidget {
  @override
  _AddBookingState createState() => _AddBookingState();
}

class _AddBookingState extends State<AddBooking> {
  String _bname, _bnumber, _btime, _bdate, _occasion;
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
          'Booking',
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
        width: MediaQuery.of(context).size.width,
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
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  cursorColor: Colors.grey,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Name',
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
                  onSaved: (value) => _bname = value.trim(),
                  onChanged: (value) => _bname = value.trim(),
                )),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: TextFormField(
                cursorColor: Colors.grey,
                cursorHeight: 25,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Contact No',
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
                onSaved: (value) => _bnumber = value.trim(),
                onChanged: (value) => _bnumber = value.trim(),
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  cursorColor: Colors.grey,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Occasion',
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
                  onSaved: (value) => _occasion = value.trim(),
                  onChanged: (value) => _occasion = value.trim(),
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
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(width: 1),
                ),
                onPressed: () {
                  _bdate = pickedDate.toString();
                  _btime = time.toString();
                  dbref.child('Booking').set({
                    "Owner_Name": _bname,
                    "Owner_Contact_No": _bnumber,
                    "Booking_date": _bdate,
                    "Booking_time": _btime,
                    "Occasion": _occasion,
                  });
                  // Navigator.pop(context);
                },
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
