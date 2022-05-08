// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.slip,
    });

    Slip slip;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        slip: Slip.fromJson(json["slip"]),
    );

    Map<String, dynamic> toJson() => {
        "slip": slip.toJson(),
    };
}

class Slip {
    Slip({
        required this.id,
        required this.advice,
    });

    final int id;
    final String advice;

    factory Slip.fromJson(Map<String, dynamic> json) => Slip(
        id: json["id"],
        advice: json["advice"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "advice": advice,
    };
}
