import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'Modules/crypto_presenter.dart';
import 'data/crypto_data.dart';
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> implements CryptoListViewContract{
    CryptoListPresenter _cryptoListPresenter;
    List<Crypto> currencies;
    bool _isloading = true;
    _MainPageState(){
      _cryptoListPresenter = new CryptoListPresenter(this);
    }

    @override
    void initState() {
    // TODO: implement initState
    super.initState();
    _cryptoListPresenter.loadCurrencies();
  }

   final List<MaterialColor> _colors = [Colors.blue,Colors.indigo,Colors.deepOrange,Colors.red];


 Widget _cryptoWidget(){
      return Container(
        child: Column(
          children: <Widget>[
            new Flexible(
                child:new ListView.builder(itemBuilder:(BuildContext context, int index){
                  final Crypto currency= currencies[index];
                  final MaterialColor color= _colors[index % _colors.length];
                  return _getUI(currency,color);
                },
                  itemCount:currencies.length,

                )
            ),
            new BottomAppBar(
              color: Colors.grey[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.black45),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.black45),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.info, color: Colors.black45),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
  ListTile _getUI(Crypto currency,MaterialColor color){
   return new ListTile(
     leading: new CircleAvatar(
       backgroundColor:color,
       child:new Text(currency.name[0]),
     ),
     title: new Text(currency.name,style: new TextStyle(
       fontWeight: FontWeight.bold,
     ),),
     subtitle:_getSubtitleText(currency.price_usd,currency.percent_change_1h),
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


      ),
      body:_isloading ? new Center(child: new CircularProgressIndicator(),): _cryptoWidget(),
    );
  }

  @override
  void onLoadComplete(List<Crypto> items) {
        setState(() {
          currencies = items;
          _isloading=false;
        });
  }

  @override
  void onLoadCryptoError() {

  }



}

