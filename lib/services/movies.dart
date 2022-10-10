import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/now-playing-response.dart';
import 'package:peliculas/models/popular-movies.dart';
import '../models/movie.dart';

class MoviesProvider extends ChangeNotifier{

  final String _apiKey    = 'c5ca431ebad5362b354af297fc10f65d';
  final String _baseUrl   = 'api.themoviedb.org';
  final String _language  = 'es-ES';
  List<Movie> onDisplayMovies = [];

  MoviesProvider(){
    getNowPlayMovies();
  }

  getNowPlayMovies() async {
    try {   
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key'   : _apiKey,
      'language'  : _language,
      'page'      : '1'
    });
    
    final response  = await http.get(url);
    final data = NowPlayingResponse.fromJson(response.body);
    onDisplayMovies = data.results; 
    } catch (error) {
    // ignore: avoid_print
    print("@ERROR get now play movies: $error" );  
    }
    notifyListeners();
  }
}


class PopularMoviesService extends ChangeNotifier {

  final String _apiKey    = 'c5ca431ebad5362b354af297fc10f65d';
  final String _baseUrl   = 'api.themoviedb.org';
  final String _language  = 'es-ES';
  
  int _popularPage = 0;
  List<Movie> movies= [];


  PopularMoviesService(){
    getPopularMovies();
  }

  getPopularMovies() async {
    try {   
      
      _popularPage++;
      var url = Uri.https(_baseUrl, '/3/movie/popular', {
        'api_key' : _apiKey,
        'language': _language,
        'page'    : '$_popularPage',
      });

      final response = await http.get(url);
      final data = PopularMovies.fromJson(response.body);
      movies = [...movies, ...data.results];
    } catch (error) {
      // ignore: avoid_print
      print("@ERROR get popular movies $error");
    }
    notifyListeners();
  }
}