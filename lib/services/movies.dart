import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/credits-response.dart';
import 'package:peliculas/models/now-playing-response.dart';
import 'package:peliculas/models/popular-movies.dart';
import 'package:peliculas/models/sarch-movie-response.dart';

import '../models/movie.dart';

class MoviesProvider extends ChangeNotifier{

  final String _apiKey    = 'c5ca431ebad5362b354af297fc10f65d';
  final String _baseUrl   = 'api.themoviedb.org';
  final String _language  = 'es-ES';
  List<Movie> onDisplayMovies = [];

  Map<int, List<Cast>> moviesCasting = {

  };

  MoviesProvider(){
    getNowPlayMovies();
  }

  getNowPlayMovies() async {
    try {   
    final url = Uri.https(_baseUrl, '3/movie/now_playing', {
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
  

  Future<List<Cast>> getMovieCasting(int movieId) async {

    if(moviesCasting.containsKey(movieId)) return moviesCasting[movieId]!; // verifica que si ya se cargaron los actores antes, no se vuelva a hacer la peticion al servidor
  
    final url = Uri.https(_baseUrl, '3/movie/$movieId/credits', {
      'api_key'   : _apiKey,
      'language'  : _language,
      'page'      : '1'
    });

    final response = await http.get(url);
    final data = CreditsResponse.fromJson(response.body);
    moviesCasting[movieId] = data.cast;
    return data.cast;
  }

  Future <List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie', {
      'api_key'   : _apiKey,
      'language'  : _language,
      'query'     : query,
    });

    final response = await http.get(url);
    final data = SearchMovieResponse.fromJson(response.body);
    return data.results;
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
      final url = Uri.https(_baseUrl, '/3/movie/popular', {
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