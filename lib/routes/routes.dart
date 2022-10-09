import 'package:flutter/material.dart';
import 'package:peliculas/pages/details.dart';
import 'package:peliculas/pages/home.dart';

 Map<String, Widget Function(BuildContext)> routes = {
  'home'    : (_)=> const HomePage(),
  'details' : (_)=> const DetailsPage(),
};