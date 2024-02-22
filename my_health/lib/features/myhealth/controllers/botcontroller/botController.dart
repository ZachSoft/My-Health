import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:my_health/data/repositories/botrepository/botrepository.dart';
import 'package:my_health/features/myhealth/models/botChatModel/BotChatModel.dart';
import 'package:my_health/features/myhealth/models/partChatModel/partchatmodel.dart';
import 'package:my_health/utils/helpers/networkmanager.dart';
import 'package:my_health/utils/popups/loaders.dart';

class BotController extends GetxController {
  static BotController get instance => Get.find();

  // Initializing some helpers variables
  final storage = GetStorage();
  final isfirstchat = true.obs;
  final _botRepository = BotRepository();
  final _networkManager = Get.put(NetworkManager());
  final is_bot_typing = false.obs;

  final isEnable = false.obs;
  final userinput = TextEditingController();
  final inputkey = GlobalKey<FormState>();
  final _focusnode = FocusNode();
  RxList<BotchatModel> messages = <BotchatModel>[].obs;

  @override
  void onInit() {
    fetchMessagesinLocalStorage();
    storage.writeIfNull("ISFIRSTCHAT", true);
    super.onInit();
  }

  Future<void> fetchMessagesinLocalStorage() async {
    // ignore: await_only_futures
    final box = await Hive.box<BotchatModel>("Messages");
    messages.clear(); // Clear existing messages
    messages.addAll(box.values);
  }

  void changeIsFirstChat() {
    storage.write("ISFIRSTCHAT", false);
    isfirstchat.value = storage.read("ISFIRSTCHAT");
  }

  void enableMessageSendingMethod() {
    if (userinput.text.trim().isNotEmpty) {
      isEnable.value = true;
    }
  }

  // Sending message for users

  Future<void> sendingMessagebyUser() async {
    try {
      final isConnected = await _networkManager.isconnected();
// Checking connectivity
      if (!isConnected) return;

// Form Validation
      if (!inputkey.currentState!.validate()) {
        return;
      }
// Adding the message

// check the input

      if (userinput.text.isEmpty || userinput.text.trim().isEmpty) {
        return;
      }

      final message = BotchatModel(
        role: "user",
        parts: [
          PartChatModel(text: userinput.text.trim()),
        ],
      );
      // messages.add(message);
      final boxMessage = Hive.box<BotchatModel>("Messages");
      boxMessage.add(message);
      messages.add(message);

// Clearing the input after sending the message;
      userinput.clear();
// Removing the keyboard input

      _focusnode.unfocus();

// Make is Ai typing
      is_bot_typing.value = true;
// Passing our message to the chat repository
      final String? generatedText =
          await _botRepository.generateChatText(messages);
      is_bot_typing.value = false;
      if (generatedText!.isNotEmpty) {
        final generatedMessage = BotchatModel(
          role: "model",
          parts: [
            PartChatModel(text: generatedText.trim().capitalizeFirst!),
          ],
        );
        // messages.add(generatedMessage);

        boxMessage.add(generatedMessage);
        messages.add(generatedMessage);
      }
    } catch (e) {
      is_bot_typing.value = false;
      messages.removeLast();
      // Remove the last message from the Hive box
      final boxMessage = Hive.box<BotchatModel>("Messages");
      boxMessage.deleteAt(boxMessage.length - 1);
      Loaders.errorSnackbar(title: "Oh snap", message: e.toString());
    }
  }
}
