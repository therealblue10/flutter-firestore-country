// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CountryStore on _CountryStore, Store {
  final _$countriesAtom = Atom(name: '_CountryStore.countries');

  @override
  ObservableList<Country> get countries {
    _$countriesAtom.context.enforceReadPolicy(_$countriesAtom);
    _$countriesAtom.reportObserved();
    return super.countries;
  }

  @override
  set countries(ObservableList<Country> value) {
    _$countriesAtom.context.conditionallyRunInAction(() {
      super.countries = value;
      _$countriesAtom.reportChanged();
    }, _$countriesAtom, name: '${_$countriesAtom.name}_set');
  }

  final _$_CountryStoreActionController =
      ActionController(name: '_CountryStore');

  @override
  void fetchCountries() {
    final _$actionInfo = _$_CountryStoreActionController.startAction();
    try {
      return super.fetchCountries();
    } finally {
      _$_CountryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'countries: ${countries.toString()}';
    return '{$string}';
  }
}
