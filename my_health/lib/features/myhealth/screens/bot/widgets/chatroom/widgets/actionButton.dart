import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/icons/circular_icon.dart';
import 'package:my_health/features/myhealth/controllers/botcontroller/botController.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';

import 'package:flutter/material.dart';

class ActionSendMessagewithInput extends StatelessWidget {
  const ActionSendMessagewithInput({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BotController());
    return TRoundedContainer(
      backgroundColor: Tcolors.primary.withOpacity(0.4),
      padding: const EdgeInsets.all(Tsizes.md),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Form(
              key: controller.inputkey,
              child: TextFormField(
                inputFormatters: [
                  TextInputFormatter.withFunction(
                    (oldValue, newValue) {
                      // Prevent leading whitespaces
                      if (newValue.text.isNotEmpty &&
                          newValue.text.trimLeft() != newValue.text) {
                        return oldValue;
                      }
                      return newValue;
                    },
                  ),
                ],
                controller: controller.userinput,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(Tsizes.sm),
                    hintText: "Ask anything here",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: false,
                    hintStyle: Theme.of(context).textTheme.bodySmall),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () => controller.sendingMessagebyUser(),
                child: const SizedBox(
                  width: 40,
                  height: 40,
                  child: TcircularIcon(
                    backgroundcolor: Tcolors.primary,
                    icon: Icons.send,
                    color: Tcolors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
