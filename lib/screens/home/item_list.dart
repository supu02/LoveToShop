import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:love_to_shop/models/item.dart';
import 'package:love_to_shop/screens/home/item_tile.dart';
import 'package:provider/provider.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<List<Item>>(context);

    // print(items.documents);

    // for (var doc in items.documents) {
    //   print(doc.data);
    // }

    // items.forEach((item) {
    //   print(item.name);
    //   print(item.item);
    //   print(item.amount);
    //   print(item.number);
    // });
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemTile(item: items[index]);
        });
  }
}
