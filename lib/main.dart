import 'package:flutter/material.dart';
import 'custom_movie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CustomGridView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
