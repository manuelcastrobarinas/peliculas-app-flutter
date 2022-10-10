// ignore_for_file: file_names
import 'dart:convert';
import 'package:peliculas/models/movie.dart';

class PopularMovies {
    PopularMovies({
      required  this.page,
      required  this.results,
      required  this.totalPages,
      required  this.totalResults,
    });

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory PopularMovies.fromJson(String str) => PopularMovies.fromMap(json.decode(str));

    factory PopularMovies.fromMap(Map<String, dynamic> json) => PopularMovies(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}