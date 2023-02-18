import 'dart:convert';

import 'package:first/models/webtoon.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String todayUri = "today";

  Future<List<WebToon>> getTodayToons() async {
    List<WebToon> initializedWebToons = [];

    final url = Uri.parse('$baseUrl/$todayUri');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        initializedWebToons.add(WebToon.fromJson(webtoon));
      }
      return initializedWebToons;
    }
    throw Error();
  }
}
