import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:the_guardian_app/models/models.dart';

class NewsProvider extends ChangeNotifier {

  NewsProvider(){
    getNews();
  }
  
  //String categoria;
  List<News> newsResultList = [];
  int currentPage = 0;
  
  Future getNews()async{

    //// incrementar pagina de a uno para el infinite scroll
    currentPage++; 

    ///// construir URL
    const String _baseURL = 'content.guardianapis.com';
    const String _endPoint = 'search';
    const String _fields = 'bodyText,headline,thumbnail,body,trailText';
    const String _apiKey = '558fdcae-2e60-4e6b-94a8-8539ba8dd1fd';
    const String _pageSize = '10';
    final String _page = currentPage.toString();

    var url = Uri.https(_baseURL, _endPoint, {
      'show-fields': _fields,
      'page-size': _pageSize,
      'page': _page,
      'api-key': _apiKey,
    });

    //// hacer llamada http
    try {

      final respuesta = await http.get(url);

      // convertir utf-8 por que algunos caracteres se muestran mal 
      final codeUnits = respuesta.body.codeUnits;
      final algo =  Utf8Decoder().convert(codeUnits);
      
      // mapear json
      final resultados = SearchResponse.fromJson(algo);
      newsResultList.addAll(resultados.response.results);

    } catch (e) {
      print(e);
    }

    //// Provider: actualizar widgets
    notifyListeners();    
  } 
}