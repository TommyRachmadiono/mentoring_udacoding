import 'package:flutter/material.dart';
import 'package:mentoring_udacoding/pages/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _nama = '';
  String _email = '';

  _getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _nama = pref.getString('name');
      _email = pref.getString('email');
    });
  }

  void _clearPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                _clearPref();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              })
        ],
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(_nama),
              Text(_email),
            ],
          )),
    );
  }
}
