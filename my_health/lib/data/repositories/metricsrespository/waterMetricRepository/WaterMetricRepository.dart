import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_health/features/myhealth/models/metrics%20models/metricsmodels.dart';
import 'package:my_health/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:my_health/utils/exceptions/firebase_exceptions.dart';

class HydationRepository extends GetxController {
  // creating an instance
  static HydationRepository get instance => Get.find();

// creating a instance of the Firestorage

  final _db = FirebaseFirestore.instance;

// Creating a method to save user

  Future<void> saveHydration(HydrationModel hydration) async {
    try {
      String uid = AuthentificationRepository.instance.authUser!.uid;
      DocumentReference userRef = _db.collection("Hydrations").doc(uid);
      DocumentReference dateRef = userRef
          .collection("dates")
          .doc(hydration.date.toLocal().toIso8601String().split('T')[0]);

      // Check if there is a document for the given date
      DocumentSnapshot dateSnapshot = await dateRef.get();

      if (dateSnapshot.exists) {
        // Update existing document with incremented quantity
        await dateRef.update({
          'quantity': FieldValue.increment(hydration.quantity),
          'lastUpdated': FieldValue.serverTimestamp(),
        });
      } else {
        // Create a new document for the date
        await dateRef.set({
          'quantity': hydration.quantity,
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

  Future<HydrationModel?> fetchHydrationDataForCurrentDay(String userId) async {
    try {
      // Reference to the user's document in the "Hydrations" collection
      DocumentReference userRef =
          FirebaseFirestore.instance.collection("Hydrations").doc(userId);

      // Get the current date in the format used as the document ID
      String currentDate =
          DateTime.now().toLocal().toIso8601String().split('T')[0];

      // Get the document for the current date
      DocumentSnapshot dateSnapshot =
          await userRef.collection("dates").doc(currentDate).get();

      // If the document exists, extract data and create a HydrationModel object
      if (dateSnapshot.exists) {
        Map<String, dynamic> data = dateSnapshot.data() as Map<String, dynamic>;

        // Include 'lastUpdated' in the HydrationModel
        HydrationModel hydrationModel = HydrationModel(
          date: DateTime.parse(dateSnapshot.id),
          quantity:
              data['quantity'] ?? 0, // Assuming 'quantity' is the field name
          lastUpdated: data['lastUpdated'] != null
              ? (data['lastUpdated'] as Timestamp).toDate()
              : null,
        );

        return hydrationModel;
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

  Future<List<HydrationModel>> fetchAllHydrationData(String userId) async {
    List<HydrationModel> hydrationData = [];

    try {
      // Reference to the user's document in the "Hydrations" collection
      DocumentReference userRef =
          FirebaseFirestore.instance.collection("Hydrations").doc(userId);

      // Get all documents in the "dates" subcollection
      QuerySnapshot datesSnapshot = await userRef.collection("dates").get();

      // Iterate through each document in the "dates" subcollection
      for (var dateDoc in datesSnapshot.docs) {
        // Extract data from the document
        Map<String, dynamic> data = dateDoc.data() as Map<String, dynamic>;

        // Create a HydrationModel object
        HydrationModel hydrationModel = HydrationModel(
          date: DateTime.parse(dateDoc.id),
          quantity:
              data['quantity'] ?? 0, // Assuming 'quantity' is the field name
        );

        // Add the model to the list
        hydrationData.add(hydrationModel);
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

    return hydrationData;
  }
}
