import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/features/myhealth/models/botChatModel/BotChatModel.dart';
import 'package:my_health/features/myhealth/models/partChatModel/partchatmodel.dart';
import 'package:my_health/firebase_options.dart';

import 'app.dart';

Future<void> main() async {
// Initialize widgets bindings

  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

// Initialize hive
  await Hive.initFlutter();
  Hive.registerAdapter(BotchatModelAdapter());
  Hive.registerAdapter(PartChatModelAdapter());

  await Hive.openBox<BotchatModel>("Messages");

// Initialize the Get Storage

  await GetStorage.init();

// Await splash until other items load

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

// Initialize firebare

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthentificationRepository()));

  runApp(const MyApp());
}
