import 'package:country_info_app/country_list_provider.dart';
import 'package:country_info_app/region_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpDependencyInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>dependencyInjection<CountryListProvider>(),),
      ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Country Info',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RegionListPage(),
      ),
    );
  }
}

