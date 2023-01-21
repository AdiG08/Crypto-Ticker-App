import 'networking.dart';

const apiKey = '3FD7735C-2A17-4F6C-9841-4ECB14BC28B1';
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
  Future<Map<String, int>> getCoinInfo(String currency) async {
    Map<String, int> cryptoPrices = {};
    for (String crypto in cryptoList) {
      int lastPrice;
      NetworkHelper networkHelper = NetworkHelper(
          'https://rest.coinapi.io/v1/exchangerate/$crypto/$currency?apikey=$apiKey');
      var coinInfo = await networkHelper.getData();
      lastPrice = coinInfo['rate'].toInt();
      cryptoPrices[crypto] = lastPrice;
    }
    return cryptoPrices;
  }
}
