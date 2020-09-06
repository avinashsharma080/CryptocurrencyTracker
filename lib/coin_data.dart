import 'package:http/http.dart' as http;
import 'dart:convert';

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
  'ZAR',
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  final String apiUrl = 'https://rest.coinapi.io/v1/exchangerate';
  final apiKey = 'get your api key from website ';

  Future getCurrencyvalueData(String city) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requestURl = '$apiUrl/$crypto/$city?apikey=$apiKey';
      http.Response response = await http.get(requestURl);

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double price = decodedData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with server i cant fucking help';
      }
    }
    return cryptoPrices;
  }
}
