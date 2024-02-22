import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/features/authentification/models/usermodel/userModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  // creating an instance
  static UserRepository get instance => Get.find();

// creating a instance of the Firestorage

  final _db = FirebaseFirestore.instance;

// Creating a method to save user

  Future<void> saveUSerdata(Usermodel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
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

  Future<Usermodel> fetchUserData() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthentificationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return Usermodel.fromSnapshot(documentSnapshot);
      } else {
        return Usermodel.empty();
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

// Updating userdata

  Future<void> updateUserData(Usermodel updateuser) async {
    try {
      await _db
          .collection("Users")
          .doc(updateuser.id)
          .update(updateuser.toJson());
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

  // Update singlefield data

  Future<void> updateSingleFieldData(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthentificationRepository.instance.authUser?.uid)
          .update(json);
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

  // function to remove userdata from firestore

  Future<void> removeUserRecord(String userid) async {
    try {
      await _db.collection("Users").doc(userid).delete();
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

  // Function to upload any image

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));

      final url = ref.getDownloadURL();
      return url;
      
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
