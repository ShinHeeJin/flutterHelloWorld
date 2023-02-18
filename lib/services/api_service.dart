import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String todayUri = "today";

  void getTodayToons() async {
    final url = Uri.parse('$baseUrl/$todayUri');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Error();
    }
  }
}
