import 'package:flutter/material.dart';
import 'MainPage.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
void main() async{
  List currencies = await getCurrencies();
  print(currencies);


  runApp(new HomePage(currencies));}

class HomePage extends StatelessWidget {
  final List _currencies;
  HomePage(this._currencies);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.amber,

      ),
      home: new MainPage(_currencies),
    );
  }
}
Future<List> getCurrencies() async{
  String cryptoURL="https://api.coinmarketcap.com/v1/ticker/?limit=50";
  http.Response response = await http.get(cryptoURL);
  return json.decode(response.body);

}