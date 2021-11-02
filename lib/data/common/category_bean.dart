/// name : ""
/// color : ""
/// url : ""

class CategoryBean {
  String? name = "";
  String? color = "";
  dynamic? url;

  CategoryBean.withParam({String? name, String? color, String? url}) {
    this.name = name;
    this.color = color;
    this.url = url;
  }

  CategoryBean(this.name, this.color, this.url);

  CategoryBean.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    color = json["color"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["color"] = color;
    map["url"] = url;
    return map;
  }
}
