import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app2/profile.dart';
import 'package:app2/register.dart';
import 'package:app2/forgotpassword.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  List<String> data = ['', ''];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passController = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.userAlt,
                    size: 150,
                    color: Color(0xffef233c),
                  )
                ],
              ),
              const SizedBox(height: 50.0),
              TextFormField(
                controller: userController,
                decoration: const InputDecoration(
                  labelText: 'Email ID',
                ),
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'Email ID is required';
                  }
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                obscureText: true,
                controller: passController,
                decoration: const InputDecoration(
                  labelText: 'password',
                ),
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'password is required';
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Forgot Password ? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassPage()),
                      );
                    },
                    child: Text(
                      "Click Here",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                      onPressed: () async {
                        FirebaseUser user = await _logInEmailPass(
                            userController.text, passController.text);
                        data[0] = user.email;
                        data[1] = user.uid;
                        await FirebaseAuth.instance.signOut();
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setStringList('my_string_list_key', data);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(FontAwesomeIcons.solidEnvelope),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Login with Email',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                      onPressed: () async {
                        FirebaseUser user = await _logInGoogle();
                        data[0] = user.email;
                        data[1] = user.uid;
                        await FirebaseAuth.instance.signOut();
                        _googleSignIn.signOut();
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setStringList('my_string_list_key', data);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(FontAwesomeIcons.google),
                          SizedBox(width: 20),
                          Text(
                            'Login with google',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      "Click Here",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(" to register"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<FirebaseUser> _logInGoogle() async {
    FirebaseUser user;
    bool isSignedIn = await _googleSignIn.isSignedIn();
    if (isSignedIn) {
      user = await _auth.currentUser();
    } else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      user = (await _auth.signInWithCredential(credential)).user;
    }
    return user;
  }

  Future<FirebaseUser> _logInEmailPass(String email, String pass) async {
    if (_formKey.currentState.validate() == true) {
      FirebaseUser user;
      AuthResult result;
      result = await _auth
          .signInWithEmailAndPassword(email: email, password: pass)
          .catchError((err) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Login Unsuccessful",
            ),
          ),
        );
      });
      user = result.user;
      return user;
    } else {
      return null;
    }
  }
}
