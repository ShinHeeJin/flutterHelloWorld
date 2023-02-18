class WebToon {
  final String id, title, thumb;

  WebToon.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        thumb = json["thumb"];
}
