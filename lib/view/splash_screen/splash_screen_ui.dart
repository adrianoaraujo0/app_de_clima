
import 'package:flutter/material.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text("Previsão do tempo"), centerTitle: true),
      body: Column(
        children: [
          weatherPictures(heightScreen),
          localInfos(heightScreen),
          weatherInfos(heightScreen ,widthScreen)
        ]
      ),
    );
  }

  Widget weatherPictures(double heightScreen){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,30,0,0),
      child: Center(
        child: Image.asset("assets/images/rain.png", height: heightScreen * 0.3)
      ),
    );
  }

  Widget localInfos(double heightScreen){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Text("30 °C", style: TextStyle(fontSize: heightScreen * 0.06)),
          Text("London, UK", style: TextStyle(fontSize: heightScreen * 0.02)),
          Text("Sunny", style: TextStyle(fontSize: heightScreen * 0.02)),
        ],
      ),
    );
  }

  Widget weatherInfos(double heightScreen ,double widthScreen){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: weatherInfosContainer(heightScreen, widthScreen * 0.2, true, false)),
          const  SizedBox(width: 5),
          weatherInfosContainer(heightScreen, widthScreen * 0.40, true, true),
          const SizedBox(width: 5),
          Expanded(child: weatherInfosContainer(heightScreen, widthScreen * 0.2, false, false)),
        ],
      ),
    );
  }

  Widget weatherInfosContainer(
    double height, 
    double width,
    bool onlyRadiusLeft,
    bool isBorderless
  ){
    return Container(
      height: height * 0.15, 
      width: width ,
      decoration:BoxDecoration(
        color: Colors.blue,
        borderRadius:  isBorderless 
        ? null
        : BorderRadius.only(
            bottomLeft: Radius.circular(onlyRadiusLeft ? 10 : 0),
            topLeft: Radius.circular(onlyRadiusLeft ? 10 : 0),
            bottomRight: Radius.circular(onlyRadiusLeft ? 0 : 10),
            topRight: Radius.circular(onlyRadiusLeft ? 0 : 10),
          ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("78", style: TextStyle(fontSize: 30),),
            Icon(Icons.timelapse_rounded),
            Text("Wild flow")
          ],
        ),
      ),
    );
  }

}