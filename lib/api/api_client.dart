
import 'dart:convert';

import 'package:country_info_app/modules/country_module.dart';
import 'package:http/http.dart' as http;

class ApiClient {

  String baseUrl = "https://restcountries.eu/rest/v2/region/";
  
  String format(String data){
    return '{ "countries" : ' + data + '}';
  }

  Future<CountryModule> fetchCountryList(String region) async{
    http.Response response = await http.get(Uri.encodeFull(baseUrl+region),
        headers: {"Accept": "application/json"}).catchError((error){
    });

    return CountryModule.fromJson(jsonDecode(format(response.body)));
  }

}