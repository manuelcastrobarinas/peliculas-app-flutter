import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwipper extends StatelessWidget {
  const CardSwipper({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth:  size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_ , int index) {
          return GestureDetector(
            onDoubleTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage("assets/no-image.jpg"), 
                image: NetworkImage('https://loremflickr.com/640/360'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}