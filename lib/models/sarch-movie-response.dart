import 'package:peliculas/models/movie.dart';
import 'dart:convert';

class SearchMovieResponse {
    int? page;
    List<Movie> results;
    int? totalPages;
    int? totalResults;
    
    SearchMovieResponse({
      this.page,
      required  this.results,
      this.totalPages,
      this.totalResults,
    });

  
    factory SearchMovieResponse.fromJson(String str) => SearchMovieResponse.fromMap(json.decode(str));

    factory SearchMovieResponse.fromMap(Map<String, dynamic> json) => SearchMovieResponse(
        page: json["page"],
        results: json["results"] != null ? List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))) : <Movie>[],
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}
