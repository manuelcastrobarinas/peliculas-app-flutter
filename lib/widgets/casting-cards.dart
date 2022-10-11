// ignore_for_file: file_names, unused_element
import 'package:flutter/cupertino.dart';
import 'package:peliculas/services/movies.dart';
import 'package:provider/provider.dart';
import '../models/credits-response.dart';

class CastingCards extends StatelessWidget {
  
  final int movieId;
  
  const CastingCards({
    Key? key, 
    required this.movieId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future  : moviesProvider.getMovieCasting(movieId),
      builder : (_, AsyncSnapshot <List<Cast>> snapshot) {
        if( !snapshot.hasData ) {
          return Container(
            constraints: const BoxConstraints(maxWidth:150),
            height: 180,
            child: const CupertinoActivityIndicator(),
          );
        }

        final cast = snapshot.data!;

        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length,
            itemBuilder: (_,int i) => _CastCard(actor: cast[i])
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {

  final Cast actor;
  const _CastCard({
    super.key,
    required this.actor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: const AssetImage('assets/no-image.jpg'),
            image: NetworkImage(actor.fullProfilePath),
            height: 140,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const Expanded(child: SizedBox()),
        Center(child: Text(actor.name, maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,))
      ]),
    );
  }
}
