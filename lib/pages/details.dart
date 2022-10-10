import 'package:flutter/material.dart';

import '../widgets/casting-cards.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  //cambiar luego por una instancia de movie

  @override
  Widget build(BuildContext context) {
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppbar(),
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterAndTitle(),
            _Overview(),
            _Overview(),
            _Overview(),
            _Overview(),
            _Overview(),
            _Overview(),
            CastingCards(),
          ]),
        ),
      ],
    ));
  }
}

class _CustomAppbar extends StatelessWidget {
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
          child: const Text('movie.title',style: TextStyle(fontSize: 24),),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://loremflickr.com/640/360'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child:  FadeInImage(
            placeholder: const AssetImage('assets/no-image.jpg'),
            image: const NetworkImage('https://loremflickr.com/640/360'),
            height: 150,
            width: MediaQuery.of(context).size.width * 0.4,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.title',style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text('movie.originalTitle',style: textTheme.subtitle1, overflow: TextOverflow.ellipsis),
              Row(children: [
                const Icon(Icons.star_border_outlined,size: 15,color: Colors.grey),
                const SizedBox(width: 5),
                Text('movie.vote', style: textTheme.caption, maxLines: 2, overflow:  TextOverflow.ellipsis),
              ])
          ]),
        ),
      ]),
    );
  }
}


class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Exercitation consectetur dolor ut quis eiusmod proident laboris eiusmod officia eu. Sint Lorem nostrud duis nostrud aliquip ut Lorem ullamco.Nulla ad esse laborum ea eiusmod. Reprehenderit et laboris exercitation magna enim consectetur id tempor sunt ipsum deserunt ipsum non. Dolor excepteur dolore cillum cillum aliquip dolor incididunt enim.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,

      ),
    );
  }
}