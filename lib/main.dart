import 'package:flutter/material.dart';

import 'home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fab Todo',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(37, 43, 103, 1),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromRGBO(37, 43, 103, 1),
          elevation: 0,
        ),
      ),
      home:  HomeView(),
    );
  }
}

