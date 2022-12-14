import 'package:flutter/material.dart';
import 'package:peliculas/routes/routes.dart';
import 'package:peliculas/services/movies.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppProviderState());
}

class AppProviderState extends StatelessWidget {
  const AppProviderState({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> MoviesProvider(), lazy: false),
        ChangeNotifierProvider(create: (_)=> PopularMoviesService(),lazy:  false,)
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: routes,
      theme: ThemeData.light().copyWith(
        appBarTheme: const  AppBarTheme(
          color: Colors.indigo
        )
      ),
    );
  }
}
