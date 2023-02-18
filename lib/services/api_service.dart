import 'dart:convert';

import 'package:first/models/webtoon.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static String todayUri = "today";

  static Future<List<WebToonModel>> getTodayToons() async {
    List<WebToonModel> initializedWebToons = [];

    final url = Uri.parse('$baseUrl/$todayUri');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        initializedWebToons.add(WebToonModel.fromJson(webtoon));
      }
      return initializedWebToons;
    }
    throw Error();
  }
}
