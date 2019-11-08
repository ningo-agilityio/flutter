import 'dart:io';
import 'dart:convert';

const endpoint = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/short';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  CoinData();

  Future<HttpClientResponse> getCoinData(currency) {
    return HttpClient()
        .getUrl(Uri.parse('$endpoint?fiat=$currency&crypto=BTC,ETH,LTC'))
        .then(
      (HttpClientRequest request) {
        return request.close();
      },
    ).then(
      (HttpClientResponse response) {
        return response;
      },
    );
  }
}
