import 'package:geolocator/geolocator.dart';

class PostosController{

  double latitude = 0.0;
  double longitude = 0.0;
  String error = "";

  getPosicao() async{
    try{
      Position position = await _posicaoAtual();
      latitude = position.latitude;
      longitude = position.longitude;
    }catch(e){
      print("ERROR: $e");
    }
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permission;
    bool ativado = await Geolocator.isLocationServiceEnabled();

    if(!ativado){
      return Future.error("Por favor, habilite a localização do smathphone.");
    }

    permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        return Future.error("Você precisa habilitar o acesso a localização do smathphone.");
      }
    }

    if(permission == LocationPermission.deniedForever){
        return Future.error("Você precisa habilitar o acesso a localização do smathphone.");
    }

    return await Geolocator.getCurrentPosition();

  }


}