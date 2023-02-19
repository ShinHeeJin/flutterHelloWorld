import 'dart:convert';

import 'package:first/models/webtoon.dart';
import 'package:first/models/webtoon_detail.dart';
import 'package:first/models/webtoon_senario.dart';
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

  static Future<WebtoonDetailModel> getWebtoonDetailById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoonDetail = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoonDetail);
    }
    throw Error();
  }

  static Future<List<WebtoonSenarioModel>> getWebtoonSenariosById(
      String id) async {
    final List<WebtoonSenarioModel> webtoonSenarioInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoonSenarios = jsonDecode(response.body);
      for (var senario in webtoonSenarios) {
        webtoonSenarioInstances.add(WebtoonSenarioModel.fromJson(senario));
      }
      return webtoonSenarioInstances;
    }
    throw Error();
  }
}
