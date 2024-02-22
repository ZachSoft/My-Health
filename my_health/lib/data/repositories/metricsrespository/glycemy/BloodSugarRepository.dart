import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_health/features/myhealth/models/metrics%20models/metricsmodels.dart';

class BloodSugarRepository extends GetxController {
  // creating an instance
  static BloodSugarRepository get instance => Get.find();

// creating a instance of the Firestorage

  final _db = FirebaseFirestore.instance;

// Creating a method to save user

  Future<void> saveBloodsugar(GlycemyModel bloodsugar) async {
    try {
      String uid = AuthentificationRepository.instance.authUser!.uid;
      DocumentReference userRef = _db.collection("Bloodsugars").doc(uid);
      DocumentReference dateRef = userRef
          .collection("dates")
          .doc(bloodsugar.date!.toLocal().toIso8601String().split('T')[0]);

      // Create a subcollection for time entries on the given date
      CollectionReference timeCollectionRef = dateRef.collection("times");

      // Create a new document for the time entry
      await timeCollectionRef.add({
        'quantity': bloodsugar.quantity,
        'lastUpdated': FieldValue.serverTimestamp(),
        'timestamp': DateTime.now(), // Add timestamp field with current time
      });
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

  // Fetching userdata from cloud firestore

  Future<List<GlycemyModel>> getBloodsugarForToday() async {
    try {
      String uid = AuthentificationRepository.instance.authUser!.uid;
      DocumentReference userRef = _db.collection("Bloodsugars").doc(uid);

      DateTime today = DateTime.now();
      String todayDateString = today.toLocal().toIso8601String().split('T')[0];

      DocumentReference dateRef =
          userRef.collection("dates").doc(todayDateString);

      CollectionReference timeCollectionRef = dateRef.collection("times");
      QuerySnapshot querySnapshot = await timeCollectionRef.get();

      List<GlycemyModel> bloodSugarList = [];
      for (var document in querySnapshot.docs) {
        bloodSugarList.add(GlycemyModel(
          quantity: document['quantity'],
          date: today,
          lastUpdated: document['lastUpdated']?.toDate(),
        ));
      }

      return bloodSugarList;
    } on FirebaseException catch (e) {
      throw e.code;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw "Something went wrong";
    }
  }

  // fetcch for all the week

  Future<List<BloodLevelData>> getWeeklyBloodsugarAverages() async {
    try {
      String uid = AuthentificationRepository.instance.authUser!.uid;
      DocumentReference userRef = _db.collection("Bloodsugars").doc(uid);

      DateTime today = DateTime.now();
      List<BloodLevelData> weekData = [];

      for (int i = 0; i < 7; i++) {
        DateTime day = today.subtract(Duration(days: i));
        String dayDateString = day.toLocal().toIso8601String().split('T')[0];

        DocumentReference dateRef =
            userRef.collection("dates").doc(dayDateString);
        CollectionReference timeCollectionRef = dateRef.collection("times");
        QuerySnapshot querySnapshot = await timeCollectionRef.get();

        double totalQuantity = 0;
        int count = 0;

        for (var document in querySnapshot.docs) {
          totalQuantity += document['quantity'];
          count++;
        }

        double averageQuantity = count > 0 ? totalQuantity / count : 0;
        weekData.add(BloodLevelData(dayDateString, averageQuantity));
      }

      return weekData;
    } on FirebaseException catch (e) {
      throw e.code;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw "Something went wrong";
    }
  }
}
