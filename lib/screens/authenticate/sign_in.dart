import 'package:flutter/material.dart';
import 'package:love_to_shop/services/auth.dart';
import 'package:love_to_shop/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

final AuthService _auth = AuthService();

class _SignInState extends State<SignIn> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Love To Shop'),
        backgroundColor: Color(0xff61c0bf),
        actions: [
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Container(
        color: Color(0xfffae3d9),
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(padding: EdgeInsets.only(top: 80.0)),
            CircleAvatar(
              child: Image.asset('assets/cart.png'),
              radius: 80.0,
              backgroundColor: Colors.transparent,
            ),
            Form(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: kTextInputDecoration.copyWith(
                        hintText: 'Enter your email'),
                    onChanged: (val) {
                      email = val;
                    },
                  ),
                  SizedBox(
                    height: 13.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: kTextInputDecoration.copyWith(
                      hintText: 'Enter your password',
                    ),
                    onChanged: (val) {
                      password = val;
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  RaisedButton(
                    color: Color(0xffffb6b9),
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 17.0),
                    ),
                    onPressed: () async {
                      dynamic result = await _auth.signInAnon();
                      if (result == null) {
                        print('Error signing in');
                      } else {
                        print('Signed In');
                        print(result);
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
