// ignore_for_file: unused_element, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';
import '../services/movies.dart';

class MovieSearchDelegate extends SearchDelegate {

  @override
  String get searchFieldLabel => 'Buscar Pelicula';
  
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear_rounded),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: ()=> close(context, null), 
    icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return _emptyContainer('No hubo resultados de la busqueda');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    if(query.isEmpty) {
     _emptyContainer('');
    }
    
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    moviesProvider.getSuggestionsByQuery( query );

    return StreamBuilder(
      stream: moviesProvider.suggestionsStream,
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) { 
        
        if(!snapshot.hasData) return _emptyContainer('');
        
        final movie = snapshot.data!;
        
        return ListView.builder(
          itemCount:  movie.length,
          itemBuilder: (_ , index ) =>  _MovieItem(movie:movie[index]),
        );
       },
    );
  }


  Widget _emptyContainer(String? text){
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.movie_creation_outlined, color: Colors.black45,size: 150),
          Text('$text',style: TextStyle(color: Colors.black54)),
        ],
      ),
    
    );
  }

}


class _MovieItem extends StatelessWidget {

  final Movie movie;
  
  const _MovieItem({
    super.key,
    required this.movie
  });

  @override
  Widget build(BuildContext context) {

    movie.idHero = '${movie.id}';
    return ListTile(
      leading: Hero(
        tag: movie.idHero!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: NetworkImage(movie.moviePosterImage),
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
    );
  }
}