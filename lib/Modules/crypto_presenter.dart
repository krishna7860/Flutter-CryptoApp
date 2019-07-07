import 'package:flutter_crypto/data/crypto_data.dart';

import '../dependency_injection.dart';

abstract class CryptoListViewContract {
  void onLoadComplete(List<Crypto> items);

  void onLoadCryptoError();
}

class CryptoListPresenter {
  CryptoListViewContract _view;
  CryptoRepository _cryptoRepository;

  CryptoListPresenter(this._view) {
    _cryptoRepository = new Injector().cryptoRepository;
  }

  void loadCurrencies() {
    _cryptoRepository
        .fetchCurrencies()
        .then((c) => _view.onLoadComplete(c))
        .catchError((onError) => _view.onLoadCryptoError());
  }
}
