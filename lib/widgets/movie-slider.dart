// ignore_for_file: file_names
import '../models/movie.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatefulWidget {

  final List<Movie> movies;
  final String title;
  final Function nextPageMovie;

  const MovieSlider({
    super.key, 
    required this.movies,
    required this.title, 
    required this.nextPageMovie,
  });

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent -200 ) {
       widget.nextPageMovie();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(widget.title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (_, i) => _MoviePoster(movies:widget.movies , cantidad: i ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  
  final List<Movie> movies;
  final int cantidad;

  const _MoviePoster({
    required this.movies, 
    required this.cantidad,
  });

  @override
  Widget build(BuildContext context) {
    final movie = movies[cantidad];
    return  Container(
      width: 130,
      height: 260,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          GestureDetector(
            onTap: ()=> Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect( 
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.moviePosterImage),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
           Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          
          )
        ],
      ),

    );
  }
}