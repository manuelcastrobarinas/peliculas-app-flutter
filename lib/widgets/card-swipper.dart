// ignore_for_file: file_names
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../models/movie.dart';

class CardSwipper extends StatelessWidget {

  final List<Movie> movies;
  const CardSwipper({
    super.key, 
    required  this.movies
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth:  size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_ , int index) {
          final movie = movies[index];
          return GestureDetector(
            onDoubleTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage("assets/no-image.jpg"), 
                image: NetworkImage(movie.moviePosterImage ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}