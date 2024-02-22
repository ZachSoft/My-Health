import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/texts/Section_heading.dart';
import 'package:my_health/features/myhealth/controllers/botcontroller/botController.dart';
import 'package:my_health/features/myhealth/screens/bot/widgets/chatroom/widgets/messageowntile.dart';
import 'package:my_health/features/myhealth/screens/bot/widgets/chatroom/widgets/messagetile.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';

class chat extends StatelessWidget {
  const chat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final messagecontroller = Get.put(BotController());
    return Obx(() {
      final allmessages = messagecontroller.messages;

      if (allmessages.isEmpty) {
        return Column(
          children: [
            Center(
              child: TRoundedContainer(
                radius: Tsizes.xl,
                width: double.infinity,
                height: 200,
                padding: const EdgeInsets.all(Tsizes.defaultSpace * 2),
                backgroundColor: Tcolors.primary.withOpacity(0.8),
                child: const Image(
                    image: AssetImage(TImagestring.myAidoctormessaging)),
              ),
            ),
            const SizedBox(
              height: Tsizes.spaceBtwItems,
            ),
            const SizedBox(
              height: Tsizes.spaceBtwItems,
            ),
            const TsectionHeading(
                headingtitle: "👩‍⚕️ Your Virtual Health Assistant! 👨‍⚕️ "),
            const SizedBox(
              height: Tsizes.spaceBtwItems,
            ),
            Text(
              "Hello there! I'm Dr. ChatBot, your friendly AI doctor. 😊 Ready to chat about your health and well-being? Whether you have questions, need advice, or just want to chat, I'm here for you!\nType 'Hello' to start our conversation. Remember, I'm here to help, and we might even share a laugh or two along the way! 🤖💬Let's get started! 👩‍⚕️🤖👨‍⚕️",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        );
      } else {
        return ListView.builder(
          shrinkWrap: true,
          reverse: true,
          itemCount: allmessages.length,
          itemBuilder: (_, index) {
            final messages = allmessages.reversed.toList();
            return messages[index].role == "user"
                ? MessageOwnTile(message: messages[index].parts.first.text)
                : MessageTile(message: messages[index].parts.first.text);
          },
        );
      }
    });
  }
}
