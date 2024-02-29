import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
}
