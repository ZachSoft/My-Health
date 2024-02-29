import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_health/features/myhealth/models/metrics%20models/metricsmodels.dart';
import 'package:my_health/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:my_health/utils/exceptions/firebase_exceptions.dart';

class CaloryRepository extends GetxController {
  // creating an instance
  static CaloryRepository get instance => Get.find();

// creating a instance of the Firestorage

  final _db = FirebaseFirestore.instance;

// Creating a method to save user

  Future<void> saveCalorie(CalorieModel calorie) async {
    try {
      String uid = AuthentificationRepository.instance.authUser!.uid;
      DocumentReference userRef = _db.collection("Calories").doc(uid);
      DocumentReference dateRef = userRef
          .collection("dates")
          .doc(calorie.date.toLocal().toIso8601String().split('T')[0]);

      // Check if there is a document for the given date
      DocumentSnapshot dateSnapshot = await dateRef.get();

      if (dateSnapshot.exists) {
        // Update existing document with incremented quantity
        await dateRef.update({
          'quantity': calorie.quantity,
          'lastUpdated': FieldValue.serverTimestamp(),
        });
      } else {
        // Create a new document for the date
        await dateRef.set({
          'quantity': calorie.quantity,
          'lastUpdated': FieldValue.serverTimestamp(),
        });
      }
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TfirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

  // Fetching userdata from cloud firestore

  Future<CalorieModel?> fetchcalorieDataForCurrentDay(String userId) async {
    try {
      // Reference to the user's document in the "calories" collection
      DocumentReference userRef =
          FirebaseFirestore.instance.collection("Calories").doc(userId);

      // Get the current date in the format used as the document ID
      String currentDate =
          DateTime.now().toLocal().toIso8601String().split('T')[0];

      // Get the document for the current date
      DocumentSnapshot dateSnapshot =
          await userRef.collection("dates").doc(currentDate).get();

      // If the document exists, extract data and create a calorieModel object
      if (dateSnapshot.exists) {
        Map<String, dynamic> data = dateSnapshot.data() as Map<String, dynamic>;

        // Include 'lastUpdated' in the calorieModel
        CalorieModel calorieModel = CalorieModel(
          date: DateTime.parse(dateSnapshot.id),
          quantity:
              data['quantity'] ?? 0, // Assuming 'quantity' is the field name
          lastUpdated: data['lastUpdated'] != null
              ? (data['lastUpdated'] as Timestamp).toDate()
              : null,
        );

        return calorieModel;
      } else {
        return null;
      }
      } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TfirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

  Future<List<CalorieModel>> fetchAllcalorieData(String userId) async {
    List<CalorieModel> calorieData = [];

    try {
      // Reference to the user's document in the "calories" collection
      DocumentReference userRef =
          FirebaseFirestore.instance.collection("Calories").doc(userId);

      // Get all documents in the "dates" subcollection
      QuerySnapshot datesSnapshot = await userRef.collection("dates").get();

      // Iterate through each document in the "dates" subcollection
      for (var dateDoc in datesSnapshot.docs) {
        // Extract data from the document
        Map<String, dynamic> data = dateDoc.data() as Map<String, dynamic>;

        // Create a calorieModel object
        CalorieModel calorieModel = CalorieModel(
          date: DateTime.parse(dateDoc.id),
          quantity:
              data['quantity'] ?? 0, // Assuming 'quantity' is the field name
        );

        // Add the model to the list
        calorieData.add(calorieModel);
      }
     } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TfirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw "Something went wrong, please try again";
    }

    return calorieData;
  }
}
