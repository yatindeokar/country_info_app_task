


import 'package:country_info_app/modules/region_module.dart';
import 'package:flutter/material.dart';

class CommonUtils{

  static const List<String> regions = ["Africa", "Americas", "Asia", "Europe", "Oceania"];
  static const List<Color> regionColor = [Colors.deepPurple, Colors.red, Colors.amber, Colors.green, Colors.orange];

  List<RegionModule> getRegionList(){
    List<RegionModule> regionsList = List();
    for(int i=0; i< regions.length; i++){

      regionsList.add(RegionModule(regionName: regions[i], regionColor: regionColor[i]));

    }
    return regionsList;
  }

  String checkForNull(String value){
    if(value == null || value.isEmpty)
      return "";

    return value;
  }

}