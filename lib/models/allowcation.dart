class Allowcation {
  Allowcation({
    this.icon,
    this.title,
  });

  String? icon;
  String? title;

  factory Allowcation.fromJson(Map<String, dynamic> json) => Allowcation(
        icon: json["icon"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "title": title,
      };
}
