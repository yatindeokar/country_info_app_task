

import 'package:country_info_app/api/api_client.dart';
import 'package:country_info_app/screens/country_details_page.dart';
import 'package:country_info_app/modules/country_module.dart';
import 'package:country_info_app/modules/region_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../country_list_provider.dart';

class CountryListPage extends StatelessWidget{

  RegionModule regionModule;

  CountryListPage({this.regionModule});

  @override
  Widget build(BuildContext context) {
    Provider.of<CountryListProvider>(context, listen: false).setCountryList(null);
    Provider.of<CountryListProvider>(context, listen: false).getCountryListFromRegion(context, regionModule.regionName);
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries"),
      ),
      body:  Consumer<CountryListProvider>(builder: (_, provider, child) {

        if(provider.getCountryModule != null && provider.getCountryModule.countries != null && provider.getCountryModule.countries.isNotEmpty)
        return AnimationLimiter(
          child: ListView.builder(
              itemCount: provider.getCountryModule.countries.length,
              itemBuilder: (context, index){
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: CountryItem(countryColor: regionModule.regionColor.withOpacity(0.5), country: provider.getCountryModule.countries[index],),

                    ),
                  ),
                );

              }),
        );

        return Center(child: CircularProgressIndicator(),);

      }),
    );
  }


}


class CountryItem extends StatelessWidget{

  final Color countryColor;
  final Countries country;

  CountryItem({this.countryColor, this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: InkWell(
        onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CountryDetailsPage(countries: country,)));
        },
        child: Card(
            color: countryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                Expanded(flex: 3, child: Text("${country.name}", maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold))),

                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      width: 80,
                      child: SvgPicture.network("${country.flag}",
                        placeholderBuilder: (BuildContext context) => Container(
                            padding: const EdgeInsets.all(30.0),
                            child: const CircularProgressIndicator()),
                      ),
                    ),
                  ),

                ],
              ),
            )),
      ),
    );
  }



}