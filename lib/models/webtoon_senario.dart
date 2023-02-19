class WebtoonSenarioModel {
  final String thumb, id, title, rating, date;

  WebtoonSenarioModel.fromJson(Map<String, dynamic> json)
      : thumb = json['thumb'],
        id = json['id'],
        title = json['title'],
        rating = json['rating'],
        date = json['date'];
}
