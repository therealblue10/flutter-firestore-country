import 'package:cloud_firestore/cloud_firestore.dart';

typedef Callback = void Function(List<Map<String, dynamic>> documents);

class FirestoreService {

//  Returns a snapshot of data, fetched directly from Firebase
  Stream<QuerySnapshot> getCountrySnapshot() {
    final firestore = Firestore.instance;
    return firestore.collection("country").snapshots();
  }

//  Subscribe for data updates using callbacks
  void subscribeCountryUpdate(Callback onDataChanged) {
    final firestore = Firestore.instance;
    firestore.collection("country").snapshots().listen((snapshot) {
      final documents = snapshot.documents.map((document) => document.data);
      onDataChanged(documents.toList());
    });
  }

}