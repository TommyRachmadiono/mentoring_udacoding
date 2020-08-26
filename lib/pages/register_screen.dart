import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _key = new GlobalKey<FormState>();
  bool _secureText = true;

  void showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  void check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: 200,
                style: FlutterLogoStyle.horizontal,
              ),
              Form(
                key: _key,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (e) {
                        return e.isEmpty ? 'please insert your name' : null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    TextFormField(
                      validator: (e) {
                        return e.isEmpty ? 'please insert email' : null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    TextFormField(
                      validator: (e) {
                        return e.isEmpty ? 'please insert password' : null;
                      },
                      obscureText: _secureText,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    TextFormField(
                      validator: (e) {
                        return e.isEmpty
                            ? 'please insert confirm password'
                            : null;
                      },
                      obscureText: _secureText,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          check();
                        },
                        child: Text('Register'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account ? "),
                    Container(
                      child: InkWell(
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
