import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'MainPage.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'dependency_injection.dart';
void main() async{

  Injector.configure(Flavour.SERVER);
  runApp(new HomePage());}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: defaultTargetPlatform == TargetPlatform.android ? Colors.grey[100] : null,


      ),
      home: new MainPage(),
    );
  }
}
