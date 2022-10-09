import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 190,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (_, i) => _CastCard()),
    );
  }
}

class _CastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage('https://loremflickr.com/640/360'),
            height: 140,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const Expanded(child: SizedBox()),
        const Text('actor.name adasdassdsa',maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)
      ]),
    );
  }
}
