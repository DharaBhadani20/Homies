import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp());
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 20),
      child: Image(
        image: AssetImage('assets/images/black-logo.png'),
        height: 200,
        width: 200,
      ),
    );
  }
}
