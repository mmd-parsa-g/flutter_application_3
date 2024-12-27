import 'dart:convert';
import 'package:flutter_application_3/repository_app/receive_data.dart';
import 'package:http/http.dart';

class RepositoryData {
  Future<List<ReceiveData>> fetchData() async {
    var response = await get(Uri.parse(
        "https://api.nobitex.ir/market/stats?srcCurrency=btc&dstCurrency=rls"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> result =
          jsonDecode(response.body)['global']['binance'];

      return result.entries
          .map((e) => ReceiveData(idName: e.key, price: e.value, isPin: false))
          .toList()
        ..sort((e1, e2) {
          var a = e2.price.compareTo(e1.price);
          if (a == 0) a = e2.idName.compareTo(e1.idName);
          return a;
        });
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
