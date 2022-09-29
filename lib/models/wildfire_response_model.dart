// To parse this JSON data, do
//
//     final wildFireResponseModel = wildFireResponseModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

WildFireResponseModel wildFireResponseModelFromJson(String str) =>
    WildFireResponseModel.fromJson(json.decode(str));

String wildFireResponseModelToJson(WildFireResponseModel data) =>
    json.encode(data.toJson());

class WildFireResponseModel {
  WildFireResponseModel({
    this.title,
    this.description,
    this.link,
    this.events,
  });

  String? title;
  String? description;
  String? link;
  List<WildFire>? events;

  factory WildFireResponseModel.fromJson(Map<String, dynamic> json) =>
      WildFireResponseModel(
        title: json["title"],
        description: json["description"],
        link: json["link"],
        events: List<WildFire>.from(
            json["events"].map((x) => WildFire.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "link": link,
        "events": List<dynamic>.from(events!.map((x) => x.toJson())),
      };
}

class WildFire {
  WildFire({
    this.id,
    this.title,
    this.description,
    this.link,
    this.categories,
    this.sources,
    this.geometries,
  });

  String? id;
  String? title;
  Description? description;
  String? link;
  List<Category>? categories;
  List<Source>? sources;
  List<Geometry>? geometries;

  factory WildFire.fromJson(Map<String, dynamic> json) => WildFire(
        id: json["id"],
        title: json["title"],
        description: descriptionValues.map![json["description"]],
        link: json["link"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        sources:
            List<Source>.from(json["sources"].map((x) => Source.fromJson(x))),
        geometries: List<Geometry>.from(
            json["geometries"].map((x) => Geometry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": descriptionValues.reverse[description],
        "link": link,
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "sources": List<dynamic>.from(sources!.map((x) => x.toJson())),
        "geometries": List<dynamic>.from(geometries!.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.id,
    this.title,
  });

  int? id;
  Title? title;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: titleValues.map![json["title"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
      };
}

enum Title { SEVERE_STORMS, VOLCANOES, WILDFIRES, SEA_AND_LAKE_ICE }

final titleValues = EnumValues({
  "Sea and Lake Ice": Title.SEA_AND_LAKE_ICE,
  "Severe Storms": Title.SEVERE_STORMS,
  "Volcanoes": Title.VOLCANOES,
  "Wildfires": Title.WILDFIRES
});

enum Description {
  EMPTY,
  D15_B_CALVED_FROM_D15_IN_JANUARY_2016,
  D15_A_CALVED_FROM_D15_IN_JANUARY_2016
}

final descriptionValues = EnumValues({
  "D15A calved from D15 in January 2016.":
      Description.D15_A_CALVED_FROM_D15_IN_JANUARY_2016,
  "D15B calved from D15 in January 2016.":
      Description.D15_B_CALVED_FROM_D15_IN_JANUARY_2016,
  "": Description.EMPTY
});

class Geometry {
  Geometry({
    this.date,
    this.type,
    this.coordinates,
  });

  DateTime? date;
  Type? type;
  List<double>? coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        date: DateTime.parse(json["date"]),
        type: typeValues.map![json["type"]],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "date": date!.toIso8601String(),
        "type": typeValues.reverse[type],
        "coordinates": List<dynamic>.from(coordinates!.map((x) => x)),
      };
}

enum Type { POINT }

final typeValues = EnumValues({"Point": Type.POINT});

class Source {
  Source({
    this.id,
    this.url,
  });

  Id? id;
  String? url;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: idValues.map![json["id"]],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "url": url,
      };
}

enum Id {
  GDACS,
  JTWC,
  NOAA_NHC,
  SI_VOLCANO,
  EO,
  INCI_WEB,
  CALFIRE,
  NATICE,
  PDC,
  MBFIRE,
  BYU_ICE,
  CEMS,
  IDC,
  NASA_DISP,
  RELIEF_WEB
}

final idValues = EnumValues({
  "BYU_ICE": Id.BYU_ICE,
  "CALFIRE": Id.CALFIRE,
  "CEMS": Id.CEMS,
  "EO": Id.EO,
  "GDACS": Id.GDACS,
  "IDC": Id.IDC,
  "InciWeb": Id.INCI_WEB,
  "JTWC": Id.JTWC,
  "MBFIRE": Id.MBFIRE,
  "NASA_DISP": Id.NASA_DISP,
  "NATICE": Id.NATICE,
  "NOAA_NHC": Id.NOAA_NHC,
  "PDC": Id.PDC,
  "ReliefWeb": Id.RELIEF_WEB,
  "SIVolcano": Id.SI_VOLCANO
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
