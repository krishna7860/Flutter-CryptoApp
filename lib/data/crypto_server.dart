import 'dart:convert';
import 'crypto_data.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
class ServerCryptoRepository implements CryptoRepository{
  String cryptoURL="https://api.coinmarketcap.com/v1/ticker/?limit=50";
  @override
  Future<List<Crypto>> fetchCurrencies() async {
    http.Response response = await http.get(cryptoURL);
    final List responseBody= json.decode(response.body);
    final statusCode=response.statusCode;
    if(statusCode!=200 || response.body==null){
      throw new FetchDataException("An Error Occurred : Status Code : $statusCode ]");
    }
    return responseBody.map((c)=>new Crypto.fromMap(c)).toList();
  }
}