import 'package:flutter/material.dart';
import 'package:peliculas/routes/routes.dart';

void main() {
  runApp(const MyApp());
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
