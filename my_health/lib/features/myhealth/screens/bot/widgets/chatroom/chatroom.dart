import 'package:get/get.dart';
import 'package:my_health/commons/widgets/images/TcircularImage.dart';
import 'package:my_health/features/myhealth/controllers/botcontroller/botController.dart';
import 'package:my_health/features/myhealth/screens/bot/widgets/chatroom/widgets/actionButton.dart';
import 'package:my_health/features/myhealth/screens/bot/widgets/chatroom/widgets/chat.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:typing_animation/typing_animation.dart';

class MyHealthchatRoomScreen extends StatelessWidget {
  const MyHealthchatRoomScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BotController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: THelperFunctions.screenHeight() / 1.6,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                  flex: 10,
                  child: chat(),
                ),
                Obx(
                  () => Expanded(
                    flex: 1,
                    child: controller.is_bot_typing.value
                        ? SizedBox(
                            child: Row(
                              children: [
                                const TcircularImage(
                                    height: 56,
                                    width: 56,
                                    image: TImagestring.myAidoctorprofile),
                                TypingAnimation(
                                  text: "Typing...",
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ),
                ),
              ],
            )),
        const ActionSendMessagewithInput()
      ],
    );
  }
}
