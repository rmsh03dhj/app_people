import 'package:app_people/main_screen.dart';
import 'package:auto_validating_text_field/auto_validating_text_field.dart';
import 'package:flutter/material.dart';

import 'validators.dart';

class LoginScreen extends StatefulWidget {
  static const String route = '/loginScreen';

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _userNameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(child: Text("Login Screen")),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                height: 30,
              ),
              SizedBox(height: 50),
              Container(width: 250, child: Text("User Name", style: TextStyle(fontSize: 16),)),
              Container(
                width: 250,
                child: AutoValidatingTextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter user name",
                  ),
                  focusNode: _userNameFocusNode,
                  controller: _userNameController,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  validators: [
                    Validators.required(),
                  ],
                  onFieldSubmitted: (_) {
                    fieldFocusChange(context, _userNameFocusNode, _passwordFocusNode);
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(width: 250, child: Text("Password", style: TextStyle(fontSize: 16),)),
              Container(
                width: 250,
                child: AutoValidatingTextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter password",
                  ),
                  obscureText: true,
                  focusNode: _passwordFocusNode,
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  validators: [
                    Validators.required(),
                    Validators.validLength(3),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 40),
              RaisedButton(
                child: Text(
                  "Sign In",
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    if (_userNameController.text == "test" && _passwordController.text == "123") {
                      Navigator.pushNamed(context, MainScreen.route);
                    } else {
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: Text(
                            "Incorrect Login details.Please use \nUsername = test and \npassword = 123",
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
