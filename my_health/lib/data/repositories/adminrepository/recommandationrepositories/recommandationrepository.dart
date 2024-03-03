import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/features/personalisation/controllers/controllers/admincontroller/addrecommandationcontroller/addrecommandationcontroller.dart';
import 'package:my_health/features/personalisation/models/recommandations/recommandationmodel.dart';
import 'package:my_health/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:my_health/utils/exceptions/firebase_exceptions.dart';

class RecommandationRepository extends GetxController {
  static RecommandationRepository get instance => Get.find();

  // helpers functions

  final _db = FirebaseFirestore.instance;

  Future<void> saveRecommandation(RecommandationModel recommandation) async {
    try {
      await _db
          .collection("Recommandations")
          .doc(recommandation.id)
          .set(recommandation.toMap());
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

  Future<List<RecommandationModel>> fetchRecommandations() async {
    try {
      final result = await _db.collection("Recommandations").get();

      final list = result.docs
          .map((document) => RecommandationModel.fromMap(document))
          .toList();

      return list;
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
  // Saving a likes

  Future<void> savelike(String recommandationId) async {
    try {
      final String userId = AuthentificationRepository.instance.authUser!.uid;
      // Fetch the existing recommendation
      DocumentSnapshot recommandationSnapshot =
          await _db.collection("Recommandations").doc(recommandationId).get();

      // Check if the recommendation exists
      if (recommandationSnapshot.exists) {
        // Convert the existing data to a Map
        Map<String, dynamic> recommandationData =
            recommandationSnapshot.data() as Map<String, dynamic>;

        // Get the existing likes array or create a new one if it doesn't exist
        List<String> likes = List<String>.from(recommandationData['likes']);

        // Check if the user has already liked the recommendation
        if (!likes.contains(userId)) {
          // Add the user's ID to the likes array
          likes.add(userId);
        } else {
          // User has already liked the recommendation, so unlike it
          likes.remove(userId);
        }

        // Update the recommendation with the new likes array
        await _db
            .collection("Recommandations")
            .doc(recommandationId)
            .update({'likes': likes});
      } else {
        // Recommendation does not exist
        throw "Recommendation does not exist.";
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

  Future<RecommandationModel> fetchOnerecommandation(String recId) async {
    try {
      final recommandation =
          await _db.collection("Recommandations").doc(recId).get();

      // Update the likes variable
  
      return RecommandationModel.fromMap(recommandation);
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
}
