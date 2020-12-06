import 'package:flutter/material.dart';

class NoticeBoard extends StatefulWidget {
  @override
  _NoticeBoardState createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  DateTime pickedDate;

  void initState() {
    super.initState();
    pickedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Notice Board',
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
        height: MediaQuery.of(context).size.height,
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                date(context),
                topic(context),
                description(context),
                upload(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget topic(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.grey,
        // cursorHeight: 25,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Topic',
          contentPadding: EdgeInsets.only(top: 20, left: 15, bottom: 20),
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
          contentPadding: EdgeInsets.only(top: 20, left: 15, bottom: 20),
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

  Widget upload(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: RaisedButton(
        onPressed: () {},
        child: Text(
          'Upload',
        ),
      ),
    );
  }
}
