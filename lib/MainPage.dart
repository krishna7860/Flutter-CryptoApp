import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
class MainPage extends StatefulWidget {
  final List currencies;
  MainPage(this.currencies);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


   final List<MaterialColor> _colors = [Colors.blue,Colors.indigo,Colors.deepOrange,Colors.red];


 Widget _cryptoWidget(){
      return Container(
        child: Column(
          children: <Widget>[
            new Flexible(
                child:new ListView.builder(itemBuilder:(BuildContext context, int index){
                  final Map currency= widget.currencies[index];
                  final MaterialColor color= _colors[index % _colors.length];
                  return _getUI(currency,color);
                },
                  itemCount:widget.currencies.length,
                )
            ),
          ],
        ),
      );
  }
  ListTile _getUI(Map currency,MaterialColor color){
   return new ListTile(
     leading: new CircleAvatar(
       backgroundColor:color,
       child:new Text(currency["name"][0]),
     ),
     title: new Text(currency["name"],style: new TextStyle(
       fontWeight: FontWeight.bold,
     ),),
     subtitle:_getSubtitleText(currency["price_usd"],currency["percent_change_1h"]),
     isThreeLine: true,
   );
  }

  Widget _getSubtitleText(String priceUSD,String percentChange ){
   TextSpan priceTextWidget= new TextSpan(
     text: "\$$priceUSD\n"
     ,style: new TextStyle(color: Colors.black),
   );
   String percentageChangeText = "1 Hour : $percentChange%";
   TextSpan percentChangeWidget;
   if(double.parse(percentChange)>0){
     percentChangeWidget = new TextSpan(text: percentageChangeText,style:new TextStyle(color:Colors.green));
   }else{
     percentChangeWidget = new TextSpan(text: percentageChangeText,style:new TextStyle(color:Colors.red));
   }
   return new RichText(text: new TextSpan(children:
    [priceTextWidget,percentChangeWidget]   ));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle:true,
        title: new Text("Cryptocurrency"),
        elevation:0.0,

      ),
      body: _cryptoWidget(),
    );
  }


}

