// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

class AdminEditProfile extends StatefulWidget {
  @override
  _AdminEditProfileState createState() => _AdminEditProfileState();
}

class _AdminEditProfileState extends State<AdminEditProfile> {
  // File _image;

  // _imgFromCamera() async {
  // PickedFile image = await ImagePicker.getImage(source: ImageSource.camera);
//     File image = await ImagePicker.pickImage(
  // source: ImageSource.camera, imageQuality: 50);

  //   setState(() {
  //     _image = image;
  //   });
  // }

  // _imgFromGallery() async {
  //   File image = await ImagePicker.pickImage(
  //       source: ImageSource.gallery, imageQuality: 50);

  //   setState(() {
  //     _image = image;
  //   });
  // }
  // void _showPicker(context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return SafeArea(
  //           child: Container(
  //             child: new Wrap(
  //               children: <Widget>[
  //                 new ListTile(
  //                     leading: new Icon(Icons.photo_library),
  //                     title: new Text('Photo Library'),
  //                     onTap: () {
  //                       _imgFromGallery();
  //                       Navigator.of(context).pop();
  //                     }),
  //                 new ListTile(
  //                   leading: new Icon(Icons.photo_camera),
  //                   title: new Text('Camera'),
  //                   onTap: () {
  //                     _imgFromCamera();
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Edit Profile"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 15, left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              _profilePic(context),
              SizedBox(
                height: 10,
              ),
              _name(context),
              SizedBox(
                height: 10,
              ),
              _phoneNo(context),
              SizedBox(
                height: 20,
              ),
              _saveButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profilePic(BuildContext context) {
    
// return Center(
//       child: GestureDetector(
//         onTap: () {
//           _showPicker(context);
//         },
//         child: CircleAvatar(
//           radius: 55,
//           backgroundColor: Color(0xffFDCF09),
//           child: _image != null
//               ? ClipRRect(
//                   borderRadius: BorderRadius.circular(50),
//                   child: Image.file(
//                     _image,
//                     width: 100,
//                     height: 100,
//                     fit: BoxFit.fitHeight,
//                   ),
//                 )
//               : Container(
//                   decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(50)),
//                   width: 100,
//                   height: 100,
//                   child: Icon(
//                     Icons.camera_alt,
//                     color: Colors.grey[800],
//                   ),
//                 ),
//         ),
//       ),
//     );
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 5),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/profile.jpg"),
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.black54,
            child: IconButton(icon: Icon(Icons.edit), onPressed: () {}),
          ),
        ),
      ],
    );
    // return Center(
    //   child: GestureDetector(
    //     onTap: () {
    //       _showPicker(context);
    //     },
    //     child: CircleAvatar(
    //       radius: 55,
    //       backgroundColor: Color(0xffFDCF09),
    //       child: _image != null
    //           ? ClipRRect(
    //               borderRadius: BorderRadius.circular(50),
    //               child: Image.file(
    //                 _image,
    //                 width: 100,
    //                 height: 100,
    //                 fit: BoxFit.fitHeight,
    //               ),
    //             )
    //           : Container(
    //               decoration: BoxDecoration(
    //                   color: Colors.grey[200],
    //                   borderRadius: BorderRadius.circular(50)),
    //               width: 100,
    //               height: 100,
    //               child: Icon(
    //                 Icons.camera_alt,
    //                 color: Colors.grey[800],
    //               ),
    //             ),
    //     ),
    //   ),
    // );
  }

  Widget _name(BuildContext context) {
    return TextFormField(
      // cursorHeight: 25,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey)),
        hintText: 'Name',
        prefixIcon: Icon(
          Icons.person,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _phoneNo(BuildContext context) {
    return TextFormField(
      // cursorHeight: 25,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey)),
        hintText: 'Contact No.',
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _saveButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FlatButton(
          padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
          color: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: () {},
          child: Text(
            "Save",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
    );
  }
}
