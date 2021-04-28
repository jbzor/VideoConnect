/**
 * Author: jbzor
 *profile: https://github.com/jbzor
 *instagram: https://www.instagram.com/jeanbaptiste.nzudie
 *facebook: https://www.facebook.com/jeanbaptiste.nzudie.3
 *linkdin: https://www.linkedin.com/in/Jean-Baptiste-dessigi-nzudie-643527147/
  */

import 'package:flutter/material.dart';

import 'src/pages/index.dart';


void main() => runApp(MyApp(),);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'F2F',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
    );
  }
}
