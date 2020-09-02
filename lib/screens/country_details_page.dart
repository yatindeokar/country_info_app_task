

import 'package:country_info_app/common_utils/common_utils.dart';
import 'package:country_info_app/modules/country_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CountryDetailsPage extends StatelessWidget{

  Countries countries;

  CountryDetailsPage({@required this.countries});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [

            Text("${countries.region}", maxLines: 1, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21, color: Colors.white),),
            Container(width: 180, child: Text(" / ${countries.name}", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21, color: Colors.white),)),

          ],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Card(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 80,
                              width: 110,
                              margin: EdgeInsets.all(10),
                              child: SvgPicture.network(countries.flag,
                                placeholderBuilder: (BuildContext context) => Container(
                                    height: 80, width: 110, color: Colors.blueGrey,
                                    child: Center(child: Text("Flag", style: TextStyle(color: Colors.white54),),)),
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 100,
                              padding: const EdgeInsets.only(top: 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text("${countries.name}" + " (${countries.alpha3Code})", maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

                                  SizedBox(height: 5,),

                                  Text("${countries.capital}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blueGrey),),

                                ],
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                    children: [

                    cardView("Demonym", "${countries.demonym}"),
                    cardView("Calling Code", "${countries.callingCodes[0]}"),
                    cardView("Currency", CommonUtils().checkForNull(countries.currencies[0].symbol) + " ${countries.currencies[0].name}"),
                    cardView("Population", "${countries.population}"),

                    ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget cardView(String label, String value){

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: EdgeInsets.only(left: 10, right: 10),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.blueGrey),),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(value, textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
          ],
        ),
      ),
    );

  }


}