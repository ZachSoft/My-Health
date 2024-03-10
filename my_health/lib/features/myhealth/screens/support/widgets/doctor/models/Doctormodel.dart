// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_health/features/myhealth/screens/support/widgets/doctor/models/DoctorReviewModel.dart';

class DoctorModel {
  String id;
  String specialization;
  List<String> qualifications;
  int experience;
  AddressModel address;
  List<String>? languagesSpoken; // Nullable
  List<AppointmentFeeModel> appointments; // Nullable
  List<ReviewModel> reviews;
  double averageRating;
  String? licenseNumber; // Nullable
  DateTime? licenseExpirationDate; // Nullable
  String? affiliation; // Nullable
  List<String>? specialServices; // Nullable
  List<ScheduleModel> schedules;
  int? numberOfAppointmentsTaken; // Nullable

  DoctorModel({
    required this.id,
    required this.specialization,
    required this.qualifications,
    required this.experience,
    required this.address,
    this.languagesSpoken,
    required this.appointments,
    required this.reviews,
    required this.averageRating,
    this.licenseNumber,
    this.licenseExpirationDate,
    this.affiliation,
    this.specialServices,
    required this.schedules,
    this.numberOfAppointmentsTaken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'specialization': specialization,
      'qualifications': qualifications,
      'experience': experience,
      'address': address.toMap(),
      'languagesSpoken': languagesSpoken,
      'appointments': appointments.map((x) => x.toMap()).toList(),
      'reviews': reviews.map((x) => x.toMap()).toList(),
      'averageRating': averageRating,
      'licenseNumber': licenseNumber,
      'licenseExpirationDate': licenseExpirationDate?.millisecondsSinceEpoch,
      'affiliation': affiliation,
      'specialServices': specialServices,
      'schedules': schedules.map((x) => x.toMap()).toList(),
      'numberOfAppointmentsTaken': numberOfAppointmentsTaken,
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      id: map['id'] as String,
      specialization: map['specialization'] as String,
      qualifications:
          List<String>.from((map['qualifications'] as List<String>)),
      experience: map['experience'] as int,
      address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
      languagesSpoken: map['languagesSpoken'] != null
          ? List<String>.from((map['languagesSpoken'] as List<String>))
          : null,
      appointments: List<AppointmentFeeModel>.from(
        (map['appointments'] as List<int>).map<AppointmentFeeModel>(
          (x) => AppointmentFeeModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      reviews: List<ReviewModel>.from(
        (map['reviews'] as List<int>).map<ReviewModel>(
          (x) => ReviewModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      averageRating: map['averageRating'] as double,
      licenseNumber:
          map['licenseNumber'] != null ? map['licenseNumber'] as String : null,
      licenseExpirationDate: map['licenseExpirationDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              map['licenseExpirationDate'] as int)
          : null,
      affiliation:
          map['affiliation'] != null ? map['affiliation'] as String : null,
      specialServices: map['specialServices'] != null
          ? List<String>.from((map['specialServices'] as List<String>))
          : null,
      schedules: List<ScheduleModel>.from(
        (map['schedules'] as List<int>).map<ScheduleModel>(
          (x) => ScheduleModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      numberOfAppointmentsTaken: map['numberOfAppointmentsTaken'] != null
          ? map['numberOfAppointmentsTaken'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorModel.fromJson(String source) =>
      DoctorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
