import 'package:edual/provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  FocusNode _focusUsername;
  FocusNode _focusPassword;
  bool _obsecureText;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _toggle() { @override
  void initState(){
    super.initState();
    _focusUsername = FocusNode();
    _focusPassword = FocusNode();
    _obsecureText = true;
  }

  @override
  void dispose(){
    _focusUsername.dispose();
    _focusPassword.dispose();
    super.dispose();
  }
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }



  @override
  Widget build(BuildContext context){
    AuthProvider _authProvider;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 130.0),
              child: Image.asset(
                'assets/images/PNG/edual-logo.png',
                height: 300.0,
                width: 300.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                controller: _usernameController,
                focusNode: _focusUsername,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: _focusUsername.hasFocus ? Theme.of(context).accentColor : Theme.of(context).primaryColor
                  ),
                  hintText: 'Username',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                onTap: (){
                  setState(() {
                     FocusScope.of(context).requestFocus(_focusUsername);
                });},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _passwordController,
                    focusNode: _focusPassword,
                    obscureText: _obsecureText,
                    decoration: InputDecoration(
                      suffixIcon:  FlatButton(
                          child: _obsecureText ? Icon(Icons.visibility) : Icon(Icons.visibility_off),                          onPressed: _toggle,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: _focusPassword.hasFocus ? Theme.of(context).accentColor : Theme.of(context).primaryColor
                      ),
                      hintText: 'Password',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        FocusScope.of(context).requestFocus(_focusPassword);
                      });},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: ElevatedButton(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150.0,40.0),
                  primary: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                onPressed: (() {
                  _authProvider = AuthProvider(provider: ServiceProvider.EMAIL);
                  _authProvider.login(_usernameController.value.text, _passwordController.value.text);
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: SignInButton(
                Buttons.Google,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                onPressed: ((){
                  _authProvider = AuthProvider(provider: ServiceProvider.GOOGLE);
                  _authProvider.login(_usernameController.value.text, _passwordController.value.text);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}