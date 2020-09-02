


import 'package:country_info_app/country_details_page.dart';
import 'package:country_info_app/country_list_page.dart';
import 'package:country_info_app/country_list_provider.dart';
import 'package:country_info_app/region_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class RegionListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Region List"),
      ),
      body:  Consumer<CountryListProvider>(builder: (_, provider, child) {
        return  AnimationLimiter(
          child: ListView.builder(
              itemCount: provider.getRegionList.length,
              itemBuilder: (context, index){
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: RegionItem(regionModule: provider.getRegionList[index], provider: provider,),
                    ),
                  ),
                );

              }),
        );
      }),

    );
  }
  
}

class RegionItem extends StatelessWidget{
  
  final RegionModule regionModule;
  final CountryListProvider provider;
  
  RegionItem({this.regionModule, this.provider});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: InkWell(
        onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CountryListPage(regionModule: regionModule,))); //
        },
        child: Card(
            color: regionModule.regionColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(child: Text(regionModule.regionName, style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),)),
        )),
      ),
    );
  }
  
  
  
}