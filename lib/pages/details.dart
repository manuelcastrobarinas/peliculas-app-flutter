// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import '../widgets/casting-cards.dart';
import '../models/movie.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  //cambiar luego por una instancia de movie

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      body: CustomScrollView(
      slivers: [
        _CustomAppbar(movie: movie),
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterAndTitle(movie: movie),
            _Overview(movie: movie),
            CastingCards(movieId: movie.id),
          ]),
        ),
      ],
    ));
  }
}

class _CustomAppbar extends StatelessWidget {

  final Movie movie;

  const _CustomAppbar({
    super.key, 
    required this.movie
  });
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 250,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
          color: Colors.black12,
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 10),
          alignment: Alignment.bottomCenter,
          child: Text(movie.title,style: const TextStyle(fontSize: 20),),
        ),
        background:FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.moviePosterImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  
  final Movie movie;

  const _PosterAndTitle({
    super.key, 
    required this.movie
  });

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Hero(
          tag: movie.idHero!,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child:  FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.moviePosterImage),
              height: 150,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movie.title,style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text(movie.originalTitle,style: textTheme.subtitle1, overflow: TextOverflow.ellipsis),
              Row(children: [
                const Icon(Icons.star_border_outlined,size: 15,color: Colors.grey),
                const SizedBox(width: 5),
                Text('${movie.voteAverage}', style: textTheme.caption, maxLines: 2, overflow:  TextOverflow.ellipsis),
              ])
          ]),
        ),
      ]),
    );
  }
}


class _Overview extends StatelessWidget {

  final Movie movie;

  const _Overview({
    super.key,
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}