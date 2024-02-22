import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/primary_header_container.dart';
import 'package:my_health/features/myhealth/controllers/botcontroller/botController.dart';
import 'package:my_health/features/myhealth/screens/bot/widgets/BotCapabilities.dart';
import 'package:my_health/features/myhealth/screens/bot/widgets/MyhealthBotAppBar.dart';
import 'package:my_health/features/myhealth/screens/bot/widgets/chatroom/chatroom.dart';
import 'package:my_health/utils/constants/sizes.dart';

class MyHealthBotScreen extends StatelessWidget {
  const MyHealthBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BotController());
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const THeaderContainer(
                  child: Padding(
                padding: EdgeInsets.only(
                    bottom: Tsizes.spaceBtwSections * 2,
                    left: Tsizes.defaultSpace),
                child: MyHealthBotAppBar(),
              )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Tsizes.defaultSpace),
                child: Column(
                  children: [
                    Obx(() {
                      return controller.isfirstchat.value
                          ? const BotCapability()
                          : const MyHealthchatRoomScreen();
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
        
        );
  }
}
