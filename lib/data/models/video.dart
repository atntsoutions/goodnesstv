class video {
  String type = '';
  String logo = '';
  String url = '';
  String group = '';
  int group_order = 0;
  int order = 0;

  video.fromJson(Map json)
      : type = json["type"],
        logo = json["logo"],
        url = json["url"],
        group = json["group"],
        group_order = json["group_order"] as int,
        order = json["order"] as int;
}
