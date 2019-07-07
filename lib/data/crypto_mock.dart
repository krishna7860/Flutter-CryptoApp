import 'crypto_data.dart';

class MockCryptoRepository implements CryptoRepository{
    @override
    Future<List<Crypto>> fetchCurrencies() {
    // TODO: implement fetchCurrencies
      return new Future.value(currencies);
  }
}

var currencies=<Crypto>[
  new Crypto(name:"Bitcoin",price_usd: "11842",percent_change_1h: "-0.4"),
  new Crypto(name:"Bitcoin1",price_usd: "11842",percent_change_1h: "-0.4"),
  new Crypto(name:"Bitcoin2",price_usd: "11842",percent_change_1h: "-0.4"),
  new Crypto(name:"Bitcoin3",price_usd: "11842",percent_change_1h: "-0.4"),
];