import 'package:flutter/material.dart';
import 'package:love_to_shop/models/item.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  ItemTile({this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0)
      child: Card(
          child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.lightBlueAccent[item.amount],
        ),
        title: Text("${item.name}'s list"),
        subtitle: Text("Number of Items : ${item.number}"),
      )),
    );
  }
}
