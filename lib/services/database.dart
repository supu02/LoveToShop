import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:love_to_shop/models/item.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices({this.uid});

  //collection reference
  final CollectionReference itemCollection =
      Firestore.instance.collection('items');

  Future updateUserData(
      String name, String item, int number, int amount) async {
    return await itemCollection.document(uid).setData(
      {'name': name, 'item': item, 'number': number, 'amount': amount},
    );
  }

  //item list from snapshot

  List<Item> _itemListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Item(
        name: doc.data['name'],
        item: doc.data['item'],
        number: doc.data['number'],
        amount: doc.data['amount'],
      );
    }).toList();
  }

// get items stream

  Stream<List<Item>> get items {
    return itemCollection.snapshots().map(_itemListFromSnapshot);
  }
}
