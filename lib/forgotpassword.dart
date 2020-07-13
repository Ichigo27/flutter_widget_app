import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassPage extends StatefulWidget {
  @override
  _ForgotPassPageState createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: ForgotPass(),
    );
  }
}

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

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
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50.0),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email ID',
                ),
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return 'Email ID is required';
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
                        forgot(emailController.text);
                      },
                      child: const Text(
                        'Send Code',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void forgot(String email) {
    if (_formKey.currentState.validate() == true) {
      FirebaseAuth _forgotpass = FirebaseAuth.instance;
      _forgotpass.sendPasswordResetEmail(email: email).then((value) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            "Password reset email send",
          ),
        ));
      }).catchError((err) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            "Password reset email unsuccessful",
          ),
        ));
      });
    }
  }
}
