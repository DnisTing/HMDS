import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hmd_system/pages/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hmd_system/pages/model/Muser.dart';
import 'package:hmd_system/pages/model/appoinment.dart';
import 'package:hmd_system/pages/profile/Userprofile.dart';

class listApt extends StatefulWidget {
  const listApt({Key? key}) : super(key: key);

  @override
  _listAptState createState() => _listAptState();
}

class _listAptState extends State<listApt> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  User? user = FirebaseAuth.instance.currentUser;
  Muser loggedInUser = Muser();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection('mUsers').doc(user!.uid).get().then(
      (value) {
        this.loggedInUser = Muser.fromMap(value.data());
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[800],
        elevation: 0,
        leading: BackButton(),
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          Row(
            children: [
              TextButton.icon(
                onPressed: null,
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: Text(''),
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => setPage(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                label: Text(''),
              ),
            ],
          )
        ],
      ),
    );
  }
}
