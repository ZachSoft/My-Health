// / Model class for userdata

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_health/utils/formatters/formatter.dart';

class Usermodel {
  String firstname;
  String lastname;
  final String email;
  final String id;
  final String username;
  String phoneNumber;
  String profilePicture;
  String? usern;
  String gender;
  bool isadmin;
  bool isdoctor;

// Constructor for userdata
  Usermodel(
      {required this.email,
      required this.id,
      this.isdoctor = false,
      this.isadmin = false,
      required this.username,
      required this.firstname,
      required this.lastname,
      required this.gender,
      required this.phoneNumber,
      required this.profilePicture});

// Helpers function for usermodel
  String get fullName => '$firstname $lastname';

  String get formattedphonenumber => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  // Generate Username

  static String generateUsername(fullName) {
    List<String> nameparts = fullName.split(" ");
    String firstname = nameparts[0].toLowerCase();
    String lastname = nameparts.length > 1 ? nameparts[1].toLowerCase() : "";

    String camelCaseUsername = '$firstname$lastname';
    String usernamewithPrefix = 'cwt_$camelCaseUsername';
    return usernamewithPrefix;
  }

  // Convert userModel to Json

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstname,
      'LastName': lastname,
      'PhoneNumber': phoneNumber,
      'Email': email,
      'Username': username,
      'ProfilePicture': profilePicture,
      'Gender': gender,
      'IsAdmin': isadmin,
      'IsDoctor': isdoctor
    };
  }

// static function to create an empty usermodel
  static Usermodel empty() => Usermodel(
      email: "",
      id: "",
      username: "",
      firstname: "",
      lastname: "",
      phoneNumber: "",
      gender: "",
      isadmin: false,
      isdoctor: false,
      profilePicture: "");

// factory methode to create a usermodel from a document Snapshot

  factory Usermodel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return Usermodel(
          email: data['Email'] ?? '',
          isdoctor: data['IsDoctor'] ?? false,
          id: document.id,
          isadmin: data['IsAdmin'] ?? false,
          username: data['Username'] ?? '',
          firstname: data['FirstName'] ?? '',
          lastname: data['LastName'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '',
          gender: data['Gender'] ?? '');
    } else {
      return Usermodel.empty();
    }
  }
}
