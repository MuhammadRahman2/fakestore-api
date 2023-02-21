import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:product_api/model/address.dart';

class FireBase {
  final db = FirebaseFirestore.instance;

  Future<void> getFirestoredata(
      {String? id,
      String? firstN,
      String? lastN,
      int? phoneN,
      String? addres,
      String? city}) async {
    final address = Address(
        id: id,
        firstName: firstN,
        lastName: lastN,
        phoneNumber: phoneN,
        address: addres,
        city: city);
    final docRef = db
        .collection('address')
        .withConverter<Address>(
            fromFirestore: (snapshot, _) => Address.fromJson(snapshot.data()),
            toFirestore: (address, options) => address.toJson())
        .doc(id);
    await docRef.set(address).then((value) {
      print('sucess Add');
    });
  }
}
