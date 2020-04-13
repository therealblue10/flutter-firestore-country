import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  /*This method will return a snapshot of data, fetched directly from Firebase*/
  Stream<QuerySnapshot> getCountrySnapshot() {
    final firestore = Firestore.instance;
    return firestore.collection("country").snapshots();
  }

}