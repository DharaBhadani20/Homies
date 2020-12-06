import 'package:flutter/material.dart';

class DatePiker extends StatefulWidget {
  @override
  _DatePikerState createState() => _DatePikerState();
}

class _DatePikerState extends State<DatePiker> {
  DateTime pickedDate;
  TimeOfDay time;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(
                '${pickedDate.year},${pickedDate.month},${pickedDate.day}'),
            trailing: Icon(Icons.keyboard_arrow_down),
            onTap: _pickDate,
          ),
          ListTile(
            title: Text('${time.hour}:${time.minute}'),
            trailing: Icon(Icons.keyboard_arrow_down),
            onTap: _pickTime,
          )
        ],
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
}
