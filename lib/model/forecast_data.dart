import 'package:flutter/material.dart';

class ForecastData extends ChangeNotifier {

  String? country;
  String? city;
  int? temp;
  String? weatherDescription;
  int? humidity;
  int? pressure;
  int? tempMax;
  

  ForecastData fromMap(Map map){
    return ForecastData(
      country: map['sys']['country'],
      city: map['city'],
      temp: map['main']['temp'],
      tempMax: map['main']['temp_max'],
      weatherDescription: map['weather'][0]['description'],
      pressure: map['main']['pressure'],
      humidity: map['main']['humidity'],
    );
  }

  ForecastData({
     this.country, 
     this.city, 
     this.temp, 
     this.weatherDescription, 
     this.humidity, 
     this.pressure, 
     this.tempMax
});

}