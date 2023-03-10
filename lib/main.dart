import 'package:flutter/material.dart';

import 'screen/home_page.dart';

 void main(){
  runApp(const MyApp());
 }

 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'api flutter',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen
      ),
      home: const HomePage(),
    );
  }
}