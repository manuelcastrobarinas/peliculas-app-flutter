import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/now-playing-response.dart';
import '../models/movie.dart';

class MoviesProvider extends ChangeNotifier{

  final String _apiKey    = 'c5ca431ebad5362b354af297fc10f65d';
  final String _baseUrl   = 'api.themoviedb.org';
  final String _language  = 'es-ES';
  List<Movie> onDisplayMovies = [];

  MoviesProvider(){
    print("movies provider inicializado");
    getNowPlayMovies();
  }

  getNowPlayMovies() async {
    print('get movies to play now');

    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key'   : _apiKey,
      'language'  : _language,
      'page'      : '1'
    });

    final response  = await http.get(url);
    final data = NowPlayingResponse.fromJson(response.body);
    onDisplayMovies = data.results;
    notifyListeners();
  }
}