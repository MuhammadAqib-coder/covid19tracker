import 'dart:convert';

import 'package:covid19_tracker/models/country_list_model.dart';
import 'package:covid19_tracker/models/world_states_model.dart';
import 'package:covid19_tracker/services/utils/app_urls.dart';
import 'package:http/http.dart' as http;

class StateServices {
  Future<WorldStatesModel> getStateServices() async {
    var response = await http.get(Uri.parse(AppUrls.worldStatesApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> getCountriesList() async {
    var list = <dynamic>[];
    final response = await http.get(Uri.parse(AppUrls.countriesList));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (var map in data) {
        list.add(map);
      }
      return list;
    } else {
      return list;
    }
  }
}
