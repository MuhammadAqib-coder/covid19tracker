class CountryListModel {
  CountryListModel({
    required this.updated,
    required this.country,
    required this.countryInfo,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    required this.continent,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion,
  });
  late final int updated;
  late final String country;
  late final CountryInfo countryInfo;
  late final int cases;
  late final int todayCases;
  late final int deaths;
  late final int todayDeaths;
  late final int recovered;
  late final int todayRecovered;
  late final int active;
  late final int critical;
  late final int casesPerOneMillion;
  late final int deathsPerOneMillion;
  late final int tests;
  late final int testsPerOneMillion;
  late final int population;
  late final String continent;
  late final int oneCasePerPeople;
  late final int oneDeathPerPeople;
  late final int oneTestPerPeople;
  late final double activePerOneMillion;
  late final double recoveredPerOneMillion;
  late final double criticalPerOneMillion;

  CountryListModel.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    country = json['country'];
    countryInfo = CountryInfo.fromJson(json['countryInfo']);
    cases = json['cases'];
    // todayCases = json['todayCases'];
    // deaths = json['deaths'];
    // todayDeaths = json['todayDeaths'];
    // recovered = json['recovered'];
    // todayRecovered = json['todayRecovered'];
    // active = json['active'];
    // critical = json['critical'];
    // casesPerOneMillion = json['casesPerOneMillion'];
    // deathsPerOneMillion = json['deathsPerOneMillion'];
    // tests = json['tests'];
    // testsPerOneMillion = json['testsPerOneMillion'];
    // population = json['population'];
    // continent = json['continent'];
    // oneCasePerPeople = json['oneCasePerPeople'];
    // oneDeathPerPeople = json['oneDeathPerPeople'];
    // oneTestPerPeople = json['oneTestPerPeople'];
    // activePerOneMillion = json['activePerOneMillion'];
    // recoveredPerOneMillion = json['recoveredPerOneMillion'];
    // criticalPerOneMillion = json['criticalPerOneMillion'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['updated'] = updated;
    _data['country'] = country;
    _data['countryInfo'] = countryInfo.toJson();
    _data['cases'] = cases;
    _data['todayCases'] = todayCases;
    _data['deaths'] = deaths;
    _data['todayDeaths'] = todayDeaths;
    _data['recovered'] = recovered;
    _data['todayRecovered'] = todayRecovered;
    _data['active'] = active;
    _data['critical'] = critical;
    _data['casesPerOneMillion'] = casesPerOneMillion;
    _data['deathsPerOneMillion'] = deathsPerOneMillion;
    _data['tests'] = tests;
    _data['testsPerOneMillion'] = testsPerOneMillion;
    _data['population'] = population;
    _data['continent'] = continent;
    _data['oneCasePerPeople'] = oneCasePerPeople;
    _data['oneDeathPerPeople'] = oneDeathPerPeople;
    _data['oneTestPerPeople'] = oneTestPerPeople;
    _data['activePerOneMillion'] = activePerOneMillion;
    _data['recoveredPerOneMillion'] = recoveredPerOneMillion;
    _data['criticalPerOneMillion'] = criticalPerOneMillion;
    return _data;
  }
}

class CountryInfo {
  CountryInfo({
    required this.id,
    required this.iso2,
    required this.iso3,
    // required this.lat,
    // required this.long,
    required this.flag,
  });
  late final int id;
  late final String iso2;
  late final String iso3;
  // late final double lat;
  // late final double long;
  late final String flag;

  CountryInfo.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    // lat = json['lat']as double;
    // long = json['long'] as double;
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['iso2'] = iso2;
    _data['iso3'] = iso3;
    // _data['lat'] = lat;
    // _data['long'] = long;
    _data['flag'] = flag;
    return _data;
  }
}
