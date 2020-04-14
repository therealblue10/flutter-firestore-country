import 'dart:async';
import 'package:country/module/country/country.dart';
import 'package:country/service/firebase/firestore_cloud_service.dart';
import 'package:flutter/foundation.dart';

class CountryBloc with ChangeNotifier {

  final _countryController = StreamController<List<Country>>();
  final firestoreService   = FirestoreService();

  Stream<List<Country>> subscribeToStream() {
    // Add firebase snapshot listener
    fetchCountries();
    return _countryController.stream;
  }

  void fetchCountries() {
      firestoreService.subscribeCountryUpdate((documents) {
         // Received updated documents
         // Map to country model
        final countries =
            documents.map((document) => Country.map(document)).toList();
        // Add documents to sink -> This in turn sends the
        // new set of documents to the stream which is being listened by
        // the Widget
        _countryController.sink.add(countries);
      });
  }

  @override
  void dispose() {
    super.dispose();
    _countryController.close();
  }

}