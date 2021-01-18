import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

class ViewNotice extends StatefulWidget {
  @override
  _ViewNoticeState createState() => _ViewNoticeState();
}

class _ViewNoticeState extends State<ViewNotice> {
  String _topic, _description, _date;

  @override
  Widget build(BuildContext context) {
    dbref.child("Notice").child("Topic").once().then((DataSnapshot snapshot) {
      setState(() {
        _topic = snapshot.value;
        print(_topic);
      });
    });
    dbref.child("Notice").child("Date").once().then((DataSnapshot snapshot) {
      setState(() {
        _date = snapshot.value;
        print(_date);
      });
    });
    dbref
        .child("Notice")
        .child("Description")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _description = snapshot.value;
        print(_description);
      });
    });
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Notice'),
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
          margin: EdgeInsets.only(
            top: 20,
          ),
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
            boxShadow: [
              BoxShadow(blurRadius: 7.0, color: Colors.white.withOpacity(1)),
            ],
          ),
          child: Container(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Date:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      _date,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Topic:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      _topic,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Decription:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Expanded(
                        child: Text(
                      _description,
                      style: TextStyle(fontSize: 18),
                    )),
                  ],
                ),
                SizedBox(
                  height: 400,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.05,
                          child: WaveWidget(
                            config: CustomConfig(
                              colors: [
                                Colors.black.withOpacity(0.1),
                                Colors.grey.withOpacity(0.2),
                                Colors.black.withOpacity(0.1),
                              ],
                              durations: [4000, 5000, 7000],
                              heightPercentages: [0.01, 0.05, 0.03],
                              blur: MaskFilter.blur(BlurStyle.solid, 5),
                            ),
                            waveAmplitude: 40.00,
                            waveFrequency: 3,
                            backgroundColor: Colors.grey[100],
                            size: Size(double.maxFinite, double.minPositive),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
