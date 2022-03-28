// To parse this JSON data, do
//
//     final listCarModel = listCarModelFromMap(jsonString);

import 'dart:convert';

class ListCarModel {
  ListCarModel({
    this.success,
    this.data,
  });

  bool? success;
  List<Datum>? data;

  factory ListCarModel.fromJson(String str) => ListCarModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListCarModel.fromMap(Map<String, dynamic> json) => ListCarModel(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Datum {
  Datum({
    this.carId,
    this.categoryId,
    this.carName,
    this.carHp,
    this.carTransmission,
    this.carSuspension,
    this.carWheelType,
    this.carHeadlightType,
  });

  int? carId;
  int? categoryId;
  String? carName;
  int? carHp;
  CarTransmission? carTransmission;
  CarSuspension? carSuspension;
  CarWheelType? carWheelType;
  CarHeadlightType? carHeadlightType;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    carId: json["car_id"],
    categoryId: json["category_id"],
    carName: json["car_name"],
    carHp: json["car_hp"],
    carTransmission: carTransmissionValues.map[json["car_transmission"]],
    carSuspension: carSuspensionValues.map[json["car_suspension"]],
    carWheelType: carWheelTypeValues.map[json["car_wheelType"]],
    carHeadlightType: carHeadlightTypeValues.map[json["car_headlightType"]],
  );

  Map<String, dynamic> toMap() => {
    "car_id": carId,
    "category_id": categoryId,
    "car_name": carName,
    "car_hp": carHp,
    "car_transmission": carTransmissionValues.reverse![carTransmission],
    "car_suspension": carSuspensionValues.reverse![carSuspension],
    "car_wheelType": carWheelTypeValues.reverse![carWheelType],
    "car_headlightType": carHeadlightTypeValues.reverse![carHeadlightType],
  };
}

enum CarHeadlightType { PROJECTOR, HID }

final carHeadlightTypeValues = EnumValues({
  "HID": CarHeadlightType.HID,
  "Projector": CarHeadlightType.PROJECTOR
});

enum CarSuspension { LTS }

final carSuspensionValues = EnumValues({
  "LTS": CarSuspension.LTS
});

enum CarTransmission { AUTOMATIC, AMT }

final carTransmissionValues = EnumValues({
  "AMT": CarTransmission.AMT,
  "Automatic": CarTransmission.AUTOMATIC
});

enum CarWheelType { ALLOY }

final carWheelTypeValues = EnumValues({
  "Alloy": CarWheelType.ALLOY
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
