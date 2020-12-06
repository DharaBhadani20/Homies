import 'package:flutter/material.dart';
// import 'package:miniproject/Drawer/Secretary_Drawer.dart';
// import 'package:miniproject/MainScreen/Home.dart';
// import 'package:miniproject/Secretary_Drawer/Date_Piker.dart';
// import 'Date_Piker.dart';

class ArrangeMeeting extends StatefulWidget {
  @override
  _ArrangeMeetingState createState() => _ArrangeMeetingState();
}

class _ArrangeMeetingState extends State<ArrangeMeeting> {
  DateTime pickedDate;
  TimeOfDay time;
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
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
              meetingSubject(context),
              date(context),
              meetingTime(context),
              venue(context),
              description(context),
              saveButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget meetingSubject(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.grey,
        // cursorHeight: 25,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Meeting Subject',
          contentPadding: EdgeInsets.only(top: 18, left: 15, bottom: 18),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget venue(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.grey,
        // cursorHeight: 25,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Venue',
          contentPadding: EdgeInsets.only(top: 18, left: 15, bottom: 18),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget description(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.grey,
        // cursorHeight: 25,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Description',
          contentPadding: EdgeInsets.only(top: 18, left: 15, bottom: 18),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget date(BuildContext context) {
    return Container(
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
    );
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

  Widget meetingTime(BuildContext context) {
    return Container(
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
    );
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

  Widget saveButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: RaisedButton(
        onPressed: () {},
        child: Text(
          'Save',
        ),
      ),
    );
  }
}
