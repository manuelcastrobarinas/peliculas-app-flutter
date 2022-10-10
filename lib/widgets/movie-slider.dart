import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Populares',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_, i) => _MoviePoster(),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 130,
      height: 260,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          GestureDetector(
            onTap: ()=> Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://loremflickr.com/640/360'),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'star wars dasdasdasdasdasdczc holasadasasdasdas mundo',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          
          )
        ],
      ),

    );
  }
}