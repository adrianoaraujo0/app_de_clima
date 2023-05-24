import 'package:app_weather/controller.dart';
import 'package:app_weather/service/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherService service = WeatherService();
  PostosController postosController = PostosController();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          Position p = await Geolocator.getCurrentPosition();
          print(p.latitude);
          print(p.longitude);
          // service.getCityName(latitude: p.latitude, longitude: p.longitude);
          service.getCurrentInfo(latitude: p.latitude, longitude: p.longitude);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
