import 'package:flutter/material.dart';
import 'package:love_to_shop/models/item.dart';
import 'package:love_to_shop/screens/home/item_list.dart';
import 'package:love_to_shop/services/auth.dart';
import 'package:love_to_shop/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Item>>.value(
      value: DatabaseServices().items,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff61c0bf),
          actions: [
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: Container(
          child: ItemList(),
        ),
      ),
    );
  }
}
