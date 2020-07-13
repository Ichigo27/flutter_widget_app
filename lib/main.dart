import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app2/profile.dart';
import 'package:app2/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xffef233c),
        accentColor: Colors.white,
        scaffoldBackgroundColor: Color(0xff2b2d42),
        textSelectionHandleColor: Colors.black,
        textSelectionColor: Color(0xff8d99ae),
        cursorColor: Color(0xffef233c),
        toggleableActiveColor: Colors.black,
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xffd90429),
          shape: RoundedRectangleBorder(),
          textTheme: ButtonTextTheme.accent,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffef233c),
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List storedData = ['', ''];
  bool visited = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      storedData = prefs.getStringList('my_string_list_key');
      if (storedData[0] != '') {
        visited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return visited ? ProfilePage() : LoginPage();
  }
}
