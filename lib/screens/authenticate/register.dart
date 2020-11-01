import 'package:flutter/material.dart';
import 'package:love_to_shop/services/auth.dart';
import 'package:love_to_shop/shared/constants.dart';
import 'package:love_to_shop/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();

class _RegisterState extends State<Register> {
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                )
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
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
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
                          validator: (val) => val.length < 6
                              ? 'Enter a password 6+ characters long'
                              : null,
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
                            'Register',
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.0),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error = 'Please supply a valid email';
                                });
                              }
                            }
                          },
                        ),
                        SizedBox(height: 20.0),
                        Text(error),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
