import 'package:flutter/material.dart';
import 'package:love_to_shop/models/user.dart';
import 'package:love_to_shop/screens/wrapper.dart';
import 'package:love_to_shop/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
