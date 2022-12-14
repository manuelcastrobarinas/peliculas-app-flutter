// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/services/movies.dart';
import 'package:peliculas/widgets/card-swipper.dart';
import 'package:peliculas/widgets/movie-slider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) { 

    final moviesProvider = Provider.of<MoviesProvider>(context);
    final popularMovies = Provider.of<PopularMoviesService>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text('Peliculas en cines')),
        actions: [
          IconButton(
            icon: const Icon(Icons.search,color: Colors.white),
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), 
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
             CardSwipper( movies: moviesProvider.onDisplayMovies ),
             MovieSlider( 
              movies: popularMovies.movies,
              title: 'Populares',
              nextPageMovie: (){
                popularMovies.getPopularMovies();
              }
            ),
          ],
        ),
      ),
    );
  }
}