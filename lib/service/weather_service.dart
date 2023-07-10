import 'dart:convert';

import 'package:app_weather/model/forecast_data.dart';
import 'package:http/http.dart' as http;

class WeatherService{

  String apiKey = "5255f7dd1a7342358e268df853897980";

  Future<ForecastData> getCurrentInfo(double latitude,  double longitude) async{
    ForecastData forecastData = ForecastData();

    try{
    
      Uri url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");
     
      http.Response response = await http.get(url);

      if(response.statusCode == 200){

        return forecastData.fromMap(jsonDecode(response.body));

      }else{
        print("REQUEST Failed: ${response.statusCode}");
        return ForecastData();
      }
    }catch (e) {
      print(e);
      return ForecastData();
    }
  }

  Future<void> getCityName(double latitude,  double longitude) async{
    try{
      Uri url = Uri.parse("http://api.openweathermap.org/geo/1.0/reverse?lat=$latitude&lon=$longitude&limit=5&appid=$apiKey");

      http.Response response = await http.get(url);

      if(response.statusCode == 200){
        print(jsonDecode(response.body));
      }else{
        print(jsonDecode(response.body));
        print("REQUEST Failed: ${response.statusCode}");
      }
    }catch (e) {
      print(e);
    }
  }


  Future<void> getClimateStatistics({required double latitude, required double longitude}) async{
    try{
      Uri url 
        = Uri.parse("https://history.openweathermap.org/data/2.5/aggregated/year?lat=0&lon=35&appid=$apiKey");

      http.Response response = await http.get(url);

      if(response.statusCode == 200){
        print(jsonDecode(response.body));
      }else{
        print(jsonDecode(response.body));
        print("REQUEST Failed: ${response.statusCode}");
      }
    }catch (e) {
      print(e);
    }
  }

}