
import 'package:country_info_app/country_list_provider.dart';
import 'package:get_it/get_it.dart';


GetIt dependencyInjection=GetIt.instance;

void setUpDependencyInjection(){
  dependencyInjection.allowReassignment=true;
  dependencyInjection.registerSingleton<CountryListProvider>(CountryListProvider());

}


void resetDependencyInjection(){
  // dependencyInjection.reset();
  dependencyInjection.registerSingleton<CountryListProvider>(CountryListProvider());

}