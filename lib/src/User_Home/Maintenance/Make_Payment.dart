import 'package:flutter/material.dart';
import 'package:custom_switch_button/custom_switch_button.dart';

class MakePayment extends StatefulWidget {
  @override
  _MakePaymentState createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  bool _isCreditCardSelected = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Payment"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Your Payment Method",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            _paymentOption(context),
            SizedBox(
              height: 50,
            ),
            _isCreditCardSelected ? _creditCardScreen() : _debitCardScreen(),
          ],
        ),
      ),
    );
  }

  Widget _paymentOption(BuildContext context) {
    return Row(
      children: <Widget>[
        _creditCard(),
        SizedBox(
          width: 20,
        ),
        _debitCard(),
      ],
    );
  }

  Widget _debitCard() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isCreditCardSelected = false;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
            color: _isCreditCardSelected ? Colors.white : Colors.grey,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
                color: _isCreditCardSelected ? Colors.black : Colors.grey)),
        child: Text(
          "Debit Card",
          style: TextStyle(
              fontSize: 16,
              color: _isCreditCardSelected ? Colors.black : Colors.white),
        ),
      ),
    );
  }

  Widget _creditCard() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isCreditCardSelected = true;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
            color: _isCreditCardSelected ? Colors.grey : Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
                color: _isCreditCardSelected ? Colors.grey : Colors.black)),
        child: Text(
          "Credit Card",
          style: TextStyle(
              fontSize: 16,
              color: _isCreditCardSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget _creditCardScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Card Number",
          style: TextStyle(fontSize: 20),
        ),
        TextFormField(
          cursorColor: Colors.grey,
          // cursorHeight: 25,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey)),
            hintText: "**** **** **** ****",
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              "Valid Until",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 120,
            ),
            Text(
              "CVV",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 150,
              child: TextFormField(
                cursorColor: Colors.grey,
                // cursorHeight: 25,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey)),
                  hintText: "Month/Year",
                ),
              ),
            ),
            SizedBox(
              width: 70,
            ),
            SizedBox(
              width: 150,
              child: TextFormField(
                cursorColor: Colors.grey,
                // cursorHeight: 25,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey)),
                  hintText: "***",
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Card Holder",
          style: TextStyle(fontSize: 20),
        ),
        TextFormField(
          cursorColor: Colors.grey,
          // cursorHeight: 25,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey)),
            hintText: "Card Holder Name",
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Save card date for further payment',
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              child: Center(
                child: CustomSwitchButton(
                  backgroundColor: Colors.grey[600],
                  unCheckedColor: Colors.white,
                  animationDuration: Duration(milliseconds: 400),
                  checkedColor: Colors.white,
                  checked: isChecked,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: FlatButton(
            padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(width: 1),
            ),
            color: Colors.grey[400],
            onPressed: () {},
            child: Text("Proceed to Confirm"),
          ),
        ),
      ],
    );
  }

  Widget _debitCardScreen() {
    return Column(
      children: <Widget>[],
    );
  }
}
