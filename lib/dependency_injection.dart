import 'data/crypto_data.dart';
import 'data/crypto_mock.dart';
import 'data/crypto_server.dart';

enum Flavour{MOCK,SERVER}

class Injector{
  static final Injector _singleton= Injector._internal();
  static Flavour _flavour;

  static void configure(Flavour flavour){
    _flavour=flavour;
  }
  factory Injector(){
    return _singleton;
  }
  Injector._internal();

  CryptoRepository get cryptoRepository{
        switch(_flavour){
          case Flavour.MOCK:return new MockCryptoRepository();
          default: return new ServerCryptoRepository();
        }
  }


}