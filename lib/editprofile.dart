import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:app2/login.dart';
import 'package:app2/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: EditProfile(),
    );
  }
}

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  List storedData = ['', '', '', ''];
  var userID;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      storedData = prefs.getStringList('my_string_list_key');
      userID = storedData[1];
      if (userID == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50.0),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'Full name is required';
                  }
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
                keyboardType: TextInputType.number,
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'age is required';
                  }
                },
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                      onPressed: () {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Checking",
                            ),
                          ),
                        );
                        _edit(nameController.text, ageController.text);
                      },
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }

  void _edit(String name, String age) {
    if (_formKey.currentState.validate()) {
      FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
      DatabaseReference databaseReference = firebaseDatabase.reference();
      databaseReference.child(userID).set({
        'name': name,
        'age': age,
      }).then((value) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            "Edit Successful",
          ),
        ));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      }).catchError((onError) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Edit Unsuccessful",
            ),
          ),
        );
      });
    }
  }
}
