// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ContactInfoModel {
  String phoneNumber;
  String email;

  ContactInfoModel({
    required this.phoneNumber,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }

  factory ContactInfoModel.fromMap(Map<String, dynamic> map) {
    return ContactInfoModel(
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactInfoModel.fromJson(String source) =>
      ContactInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ReviewModel {
  String reviewerName;
  ContactInfoModel reviewerContactInfo;
  String reviewText;
  double rating;
  DateTime timestamp;

  ReviewModel({
    required this.reviewerName,
    required this.reviewerContactInfo,
    required this.reviewText,
    required this.rating,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reviewerName': reviewerName,
      'reviewerContactInfo': reviewerContactInfo.toMap(),
      'reviewText': reviewText,
      'rating': rating,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      reviewerName: map['reviewerName'] as String,
      reviewerContactInfo: ContactInfoModel.fromMap(
          map['reviewerContactInfo'] as Map<String, dynamic>),
      reviewText: map['reviewText'] as String,
      rating: map['rating'] as double,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) =>
      ReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AppointmentFeeModel {
  String type; // e.g., "Online", "Physical", etc.
  double amount;

  AppointmentFeeModel({
    required this.type,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'amount': amount,
    };
  }

  factory AppointmentFeeModel.fromMap(Map<String, dynamic> map) {
    return AppointmentFeeModel(
      type: map['type'] as String,
      amount: map['amount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppointmentFeeModel.fromJson(String source) =>
      AppointmentFeeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AddressModel {
  String street;
  String city;
  String state;
  String country;
  AddressModel({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'city': city,
      'state': state,
      'country': country,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      street: map['street'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ScheduleModel {
  String day;
  RxBool isAvailable;
  String fromTime;
  String toTime;

  ScheduleModel({
    required this.day,
    bool isAvailable = false,
    this.fromTime = "",
    this.toTime = "",
  }) : this.isAvailable = isAvailable.obs;

  // Add a clone method if not already present
  ScheduleModel clone() {
    return ScheduleModel(
      day: day,
      isAvailable: isAvailable.value,
      fromTime: fromTime,
      toTime: toTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'isAvailable': isAvailable.value,
      'fromTime': fromTime,
      'toTime': toTime,
    };
  }

  factory ScheduleModel.fromMap(Map<String, dynamic> map) {
    return ScheduleModel(
      day: map['day'] as String,
      isAvailable: map['isAvailable'] as bool,
      fromTime: map['fromTime'] as String,
      toTime: map['toTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleModel.fromJson(String source) =>
      ScheduleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
