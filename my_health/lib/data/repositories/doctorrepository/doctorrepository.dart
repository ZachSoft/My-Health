import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/models/DoctorReviewModel.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/models/Doctormodel.dart';

class DoctorRepository extends GetxController {
  static DoctorRepository get instance => Get.find();

  // helpers functions

  final _db = FirebaseFirestore.instance;

  Future<void> saveDoctor(DoctorModel doctor) async {
    try {
      final userid = AuthentificationRepository.instance.authUser?.uid;

      await _db.collection("Doctors").doc(userid).set(doctor.toMap());
    } on FormatException catch (e) {
      throw e.message;
    } on FirebaseException catch (e) {
      throw e.code;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw "Something went wrong";
    }
  }

  Future<DoctorModel> fetchDoctorData() async {
    try {
      final documentSnapshot = await _db
          .collection("Doctors")
          .doc(AuthentificationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return DoctorModel.fromMap(documentSnapshot);
      } else {
        return DoctorModel(
            id: "",
            specialization: "",
            qualifications: [],
            experience: 0,
            address: AddressModel(street: "", city: "", state: "", country: ""),
            appointments: [],
            reviews: [],
            averageRating: 0,
            schedules: []);
      }
    } on FormatException catch (e) {
      throw e.message;
    } on FirebaseException catch (e) {
      throw e.code;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw "Something went wrong";
    }
  }

  Future<void> updateSingleDoctorField(Map<String, dynamic> json) async {
    try {
      final userid = AuthentificationRepository.instance.authUser?.uid;

      await _db.collection("Doctors").doc(userid).update(json);
    } on FormatException catch (e) {
      throw e.message;
    } on FirebaseException catch (e) {
      throw e.code;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw "Something went wrong";
    }
  }
}
