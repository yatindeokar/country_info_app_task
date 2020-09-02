


import 'package:country_info_app/api_client.dart';
import 'package:country_info_app/common_utils.dart';
import 'package:country_info_app/country_module.dart';
import 'package:country_info_app/region_module.dart';
import 'package:flutter/material.dart';

class CountryListProvider extends ChangeNotifier{

  List<RegionModule> _regionList = CommonUtils().getRegionList();

  RegionModule _selectedRegion;

  CountryModule _countryModule; 

  setRegionList(){
    _regionList = CommonUtils().getRegionList();
    notifyListeners();
  }

  List<RegionModule> get getRegionList => _regionList;

  setSelectedRegion(RegionModule regionModule){
    _selectedRegion = regionModule;
    notifyListeners();
  }

  RegionModule get getSelectedRegion => _selectedRegion;

  setCountryList(CountryModule countryModule){
    _countryModule = countryModule;
    notifyListeners();
  }

  CountryModule get getCountryModule => _countryModule;

  getCountryListFromRegion(BuildContext context, String regionName){

    ApiClient().fetchCountryList(regionName).then((value){
      _countryModule = value;
      notifyListeners();
    }).catchError((error){
      _showDialog(context, regionName);
    });

  }


  void _showDialog(BuildContext context, String region) {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("Please Connect to Internet and try again."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog

            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),

            new FlatButton(
              child: new Text("Retry"),
              onPressed: () {
                Navigator.of(context).pop();
                getCountryListFromRegion(context, region);
              },
            ),
          ],
        );
      },
    );
  }

}