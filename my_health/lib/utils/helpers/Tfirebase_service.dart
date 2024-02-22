import 'dart:io';

import 'package:my_health/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:my_health/utils/exceptions/firebase_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Tfirebaseservice extends GetxController {
  static Tfirebaseservice get instance => Get.find();

  final _firebaseservice = FirebaseStorage.instance;

//  Upload local asset from IDE
// REturn a Uint8List containing imagedata

  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imagedata = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imagedata;
    } catch (e) {
      throw ('Error loading the image data $e');
    }
  }

// Upload image using imagedata to cloud storage
// return the downloaded url of the uploaded image
  Future<String> uploadImagedata(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseservice.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();

      return url;
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

  // Upload image file
  // return the downloaded url of the uploaded image
  Future<String> uploadImagefile(String path, XFile image) async {
    try {
      final ref = _firebaseservice.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();

      return url;
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
