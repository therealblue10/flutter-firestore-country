/// name : "India"
/// population : ""
/// gdp : ""
/// head : ""

class Country {
  String _name;
  String _population;
  String _gdp;
  String _head;

  String get name => _name;
  String get population => _population;
  String get gdp => _gdp;
  String get head => _head;

  Country(this._name, this._population, this._gdp, this._head);

  Country.map(dynamic obj) {
    this._name = obj["name"];
    this._population = obj["population"];
    this._gdp = obj["gdp"];
    this._head = obj["head"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["population"] = _population;
    map["gdp"] = _gdp;
    map["head"] = _head;
    return map;
  }

}