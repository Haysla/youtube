import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyCeV2IHVh94ZNDHMoHpSeXHaCaS6RzgHQ4";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<List<Video>> pesquisar(String pesquisa) async{
    
    http.Response response = await http.get(
      URL_BASE + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API"
          "&channelId=$ID_CANAL"
          "&q=$pesquisa"
    );

    if(response.statusCode == 200){

      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
            //return Video.converterJson(map);
          }
      ).toList();

      return videos;

      /*for(var video in videos){
        print("Resultado: " + video.titulo);
      }*/
        //print("Resultado: " + videos.toString());

      /*for(var video in dadosJson["items"]){
        print("Resultado: " + video.toString());
      }*/

      //print("resultado: " + dadosJson["items"].toString());
    }else{

    }

  }
}