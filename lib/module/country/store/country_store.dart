import 'package:country/module/country/store/country.dart';
import 'package:country/service/firebase/firestore_cloud_service.dart';
import 'package:mobx/mobx.dart';

part 'country_store.g.dart';

class CountryStore = _CountryStore with _$CountryStore;

abstract class _CountryStore with Store {

  final firestoreService   = FirestoreService();

  @observable
  ObservableList<Country> countries =
  ObservableList<Country>.of([]);

  @action
  void fetchCountries() {
    firestoreService.subscribeCountryUpdate((documents) {
      // Received updated documents
      final allCountries =
      documents.map((document) {
        return Country.map(document);
      });

      // Alternatively, you can receive only those documents that are updated
      // and replace them. Here,  we are just inserting all of them at
      // once by clearing all entries first
      countries.clear();
      this.countries.addAll(allCountries.toList());

    });
  }
}