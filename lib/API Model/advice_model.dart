// To parse this JSON data, do
//
//     final adviceModel = adviceModelFromJson(jsonString);

import 'dart:convert';

AdviceModel adviceModelFromJson(String str) => AdviceModel.fromJson(json.decode(str));

String adviceModelToJson(AdviceModel data) => json.encode(data.toJson());

class AdviceModel {
    AdviceModel({
        this.slip,
    });

    Slip? slip;

    factory AdviceModel.fromJson(Map<String, dynamic> json) => AdviceModel(
        slip: json["slip"] == null ? null : Slip.fromJson(json["slip"]),
    );

    Map<String, dynamic> toJson() => {
        "slip": slip?.toJson(),
    };
}

class Slip {
    Slip({
        this.id,
        this.advice,
    });

    int? id;
    String? advice;

    factory Slip.fromJson(Map<String, dynamic> json) => Slip(
        id: json["id"],
        advice: json["advice"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "advice": advice,
    };
}
