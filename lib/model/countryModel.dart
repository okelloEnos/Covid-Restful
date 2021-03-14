// To parse this JSON data, do
//
//     final countryName = countryNameFromJson(jsonString);

import 'dart:convert';

List<CountryName> countryNameFromJson(String str) => List<CountryName>.from(json.decode(str).map((x) => CountryName.fromJson(x)));

String countryNameToJson(List<CountryName> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryName {
  CountryName({
    this.activeCasesText,
    this.countryText,
    this.lastUpdate,
    this.newCasesText,
    this.newDeathsText,
    this.totalCasesText,
    this.totalDeathsText,
    this.totalRecoveredText,
  });

  String activeCasesText;
  String countryText;
  LastUpdate lastUpdate;
  String newCasesText;
  String newDeathsText;
  String totalCasesText;
  String totalDeathsText;
  String totalRecoveredText;

  factory CountryName.fromJson(Map<String, dynamic> json) => CountryName(
    activeCasesText: json["Active Cases_text"] == null ? null : json["Active Cases_text"],
    countryText: json["Country_text"] == null ? null : json["Country_text"],
    lastUpdate: json["Last Update"] == null ? null : lastUpdateValues.map[json["Last Update"]],
    newCasesText: json["New Cases_text"] == null ? null : json["New Cases_text"],
    newDeathsText: json["New Deaths_text"] == null ? null : json["New Deaths_text"],
    totalCasesText: json["Total Cases_text"] == null ? null : json["Total Cases_text"],
    totalDeathsText: json["Total Deaths_text"] == null ? null : json["Total Deaths_text"],
    totalRecoveredText: json["Total Recovered_text"] == null ? null : json["Total Recovered_text"],
  );

  Map<String, dynamic> toJson() => {
    "Active Cases_text": activeCasesText == null ? null : activeCasesText,
    "Country_text": countryText == null ? null : countryText,
    "Last Update": lastUpdate == null ? null : lastUpdateValues.reverse[lastUpdate],
    "New Cases_text": newCasesText == null ? null : newCasesText,
    "New Deaths_text": newDeathsText == null ? null : newDeathsText,
    "Total Cases_text": totalCasesText == null ? null : totalCasesText,
    "Total Deaths_text": totalDeathsText == null ? null : totalDeathsText,
    "Total Recovered_text": totalRecoveredText == null ? null : totalRecoveredText,
  };
}

enum LastUpdate { THE_202103142015, THE_202103141915, THE_202103141714, THE_202103141814, THE_202103141613, THE_202103141312, THE_202103141412, THE_202103141513, THE_202103141111, THE_202103141211 }

final lastUpdateValues = EnumValues({
  "2021-03-14 11:11": LastUpdate.THE_202103141111,
  "2021-03-14 12:11": LastUpdate.THE_202103141211,
  "2021-03-14 13:12": LastUpdate.THE_202103141312,
  "2021-03-14 14:12": LastUpdate.THE_202103141412,
  "2021-03-14 15:13": LastUpdate.THE_202103141513,
  "2021-03-14 16:13": LastUpdate.THE_202103141613,
  "2021-03-14 17:14": LastUpdate.THE_202103141714,
  "2021-03-14 18:14": LastUpdate.THE_202103141814,
  "2021-03-14 19:15": LastUpdate.THE_202103141915,
  "2021-03-14 20:15": LastUpdate.THE_202103142015
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
