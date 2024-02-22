import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_health/features/myhealth/models/metrics%20models/metricsmodels.dart';

class WeightRepository extends GetxController {
  // creating an instance
  static WeightRepository get instance => Get.find();

// creating a instance of the Firestorage

  final _db = FirebaseFirestore.instance;

// Creating a method to save user

  Future<void> saveWeight(WeightModel weight) async {
    try {
      String uid = AuthentificationRepository.instance.authUser!.uid;
      DocumentReference userRef = _db.collection("Weights").doc(uid);
      DocumentReference dateRef = userRef
          .collection("dates")
          .doc(weight.date.toLocal().toIso8601String().split('T')[0]);

      // Check if there is a document for the given date
      DocumentSnapshot dateSnapshot = await dateRef.get();

      if (dateSnapshot.exists) {
        // Update existing document with incremented quantity
        await dateRef.update({
          'quantity': weight.quantity,
          'lastUpdated': FieldValue.serverTimestamp(),
        });
      } else {
        // Create a new document for the date
        await dateRef.set({
          'quantity': weight.quantity,
          'lastUpdated': FieldValue.serverTimestamp(),
        });
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

  // Fetching userdata from cloud firestore

  Future<WeightModel?> fetchweightDataForCurrentDay(String userId) async {
    try {
      // Reference to the user's document in the "weights" collection
      DocumentReference userRef =
          FirebaseFirestore.instance.collection("Weights").doc(userId);

      // Get the current date in the format used as the document ID
      String currentDate =
          DateTime.now().toLocal().toIso8601String().split('T')[0];

      // Get the document for the current date
      DocumentSnapshot dateSnapshot =
          await userRef.collection("dates").doc(currentDate).get();

      // If the document exists, extract data and create a weightModel object
      if (dateSnapshot.exists) {
        Map<String, dynamic> data = dateSnapshot.data() as Map<String, dynamic>;

        // Include 'lastUpdated' in the weightModel
        WeightModel weightModel = WeightModel(
          date: DateTime.parse(dateSnapshot.id),
          quantity:
              data['quantity'] ?? 0, // Assuming 'quantity' is the field name
          lastUpdated: data['lastUpdated'] != null
              ? (data['lastUpdated'] as Timestamp).toDate()
              : null,
        );

        return weightModel;
      } else {
        return null;
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

  Future<List<WeightModel>> fetchAllweightData(String userId) async {
    List<WeightModel> weightData = [];

    try {
      // Reference to the user's document in the "weights" collection
      DocumentReference userRef =
          FirebaseFirestore.instance.collection("Weights").doc(userId);

      // Get all documents in the "dates" subcollection
      QuerySnapshot datesSnapshot = await userRef.collection("dates").get();

      // Iterate through each document in the "dates" subcollection
      for (var dateDoc in datesSnapshot.docs) {
        // Extract data from the document
        Map<String, dynamic> data = dateDoc.data() as Map<String, dynamic>;

        // Create a weightModel object
        WeightModel weightModel = WeightModel(
          date: DateTime.parse(dateDoc.id),
          quantity:
              data['quantity'] ?? 0, // Assuming 'quantity' is the field name
        );

        // Add the model to the list
        weightData.add(weightModel);
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

    return weightData;
  }
}
