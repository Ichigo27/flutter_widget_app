import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:app2/main.dart';
import 'package:app2/login.dart';
import 'package:app2/widget.dart';
import 'package:app2/editprofile.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List storedData = ['', ''];
  var emailID;
  var userID;
  var name = 'Your Name';
  var age = 'Your Age';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      storedData = prefs.getStringList('my_string_list_key');
      emailID = storedData[0];
      userID = storedData[1];
      if (emailID == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
      DatabaseReference databaseReference = firebaseDatabase.reference();
      databaseReference.child(userID).once().then((DataSnapshot dataSnapshot) {
        setState(() {
          if (dataSnapshot.value['name'] != '') {
            name = dataSnapshot.value['name'];
            age = dataSnapshot.value['age'];
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Text(
                'Profile Page',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Card(
              color: Color(0xffedf2f4),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Image.network(
                      'https://www.shareicon.net/data/512x512/2016/09/15/829453_user_512x512.png',
                      height: 200,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 75,
                          child: Text(
                            'Email:',
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff2b2d42)),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            emailID,
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff2b2d42)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 75,
                          child: Text(
                            'Name:',
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff2b2d42)),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            name,
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff2b2d42)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 75,
                          child: Text(
                            'Age:',
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff2b2d42)),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            age,
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff2b2d42)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Color(0xff8d99ae),
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage()),
                      );
                    },
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WidgetPage()),
                      );
                    },
                    child: const Text(
                      'Widgets',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: const Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
