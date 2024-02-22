import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HydrationModel {
  double quantity;
  DateTime date;
  DateTime? lastUpdated;
  HydrationModel({
    required this.quantity,
    required this.date,
    this.lastUpdated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,
      'date': date,
    };
  }

  factory HydrationModel.fromMap(Map<String, dynamic> map) {
    return HydrationModel(
        quantity: map['quantity'] as double,
        date: map['date'],
        lastUpdated: map['lastUpdated']);
  }

  String toJson() => json.encode(toMap());

  factory HydrationModel.fromJson(String source) =>
      HydrationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// Second class
class CalorieModel {
  double quantity;
  DateTime date;
  DateTime? lastUpdated;
  CalorieModel({required this.quantity, required this.date, this.lastUpdated});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,
      'date': date,
    };
  }

  factory CalorieModel.fromMap(Map<String, dynamic> map) {
    return CalorieModel(
        quantity: map['quantity'] as double,
        date: map['date'],
        lastUpdated: map['lastUpdated']);
  }

  String toJson() => json.encode(toMap());

  factory CalorieModel.fromJson(String source) =>
      CalorieModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// Third class

class WeightModel {
  double quantity;
  DateTime date;
  DateTime? lastUpdated;
  WeightModel({required this.quantity, required this.date, this.lastUpdated});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,
      'date': date,
    };
  }

  factory WeightModel.fromMap(Map<String, dynamic> map) {
    return WeightModel(
        quantity: map['quantity'] as double,
        date: map['date'],
        lastUpdated: map['lastUpdated']);
  }

  String toJson() => json.encode(toMap());

  factory WeightModel.fromJson(String source) =>
      WeightModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class GlycemyModel {
  int quantity;
  DateTime? time;
  DateTime? date;
  DateTime? lastUpdated;
  GlycemyModel({
    required this.quantity,
    this.time,
    this.date,
    this.lastUpdated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,
      'time': time,
      'date': date,
      'lastUpdated': lastUpdated,
    };
  }

  factory GlycemyModel.fromMap(Map<String, dynamic> map) {
    return GlycemyModel(
      quantity: map['quantity'] as int,
      time: map['time'],
      date: map['date'],
      lastUpdated: map['lastUpdated'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GlycemyModel.fromJson(String source) =>
      GlycemyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// last model
class BloodLevelData {
  String day;
  double averageQuantity;

  BloodLevelData(this.day, this.averageQuantity);
}
