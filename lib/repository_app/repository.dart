import 'dart:convert';
import 'package:flutter_application_3/repository_app/receive_data.dart';
import 'package:http/http.dart';

class RepositoryData {
  Future<List<ReceiveData>> fetchData() async {
    var response = await get(Uri(
      
      queryParameters: {"filter" : "baseAssetId eq 'USDT'" , "orderBy" : "order desc" },
      scheme: 'https',
      host: 'api.sarrafex.com',
      path: 'exchanger/query/market'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['value'];

      return result.map((e) => ReceiveData.fromJson(e)).toList();
        
        
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
