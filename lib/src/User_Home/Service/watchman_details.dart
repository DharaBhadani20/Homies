import 'package:flutter/material.dart';

class ViewWatchmanDetails extends StatefulWidget {
  @override
  _ViewWatchmanDetailsState createState() => _ViewWatchmanDetailsState();
}

class _ViewWatchmanDetailsState extends State<ViewWatchmanDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Meeting Details'),
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
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(blurRadius: 7.0, color: Colors.white.withOpacity(1)),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Watch Man Name:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                // Text(
                //   _wname,
                //   style: TextStyle(fontSize: 18),
                // ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Contact No:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                // Text(
                //   data,
                //   style: TextStyle(fontSize: 18),
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
