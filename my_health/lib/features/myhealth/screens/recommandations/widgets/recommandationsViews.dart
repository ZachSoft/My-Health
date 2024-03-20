import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/features/personalisation/controllers/controllers/admincontroller/addrecommandationcontroller/addrecommandationcontroller.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';

class RecommandationsViews extends StatelessWidget {
  const RecommandationsViews({super.key});

  @override
  Widget build(BuildContext context) {
    final recommandationcontroller = Get.put(RecommandationController());
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: 
          ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Obx(
                () => GestureDetector(
                  onTap: () => recommandationcontroller.changecurrentpage(0),
                  child: TRoundedContainer(
                    height: 40,
                    width: 107,
                    showborder: recommandationcontroller.currentindex.value == 0
                        ? false
                        : true,
                    backgroundColor:
                        recommandationcontroller.currentindex.value == 0
                            ? Tcolors.primary
                            : Colors.transparent,
                    padding: const EdgeInsets.all(Tsizes.sm),
                    radius: Tsizes.sm,
                    child: Center(
                        child: Text(
                      "Meals",
                      style: TextStyle(
                        color: recommandationcontroller.currentindex.value == 0
                            ? Tcolors.white
                            : null,
                      ),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                width: Tsizes.md,
              ),
              Obx(
                () => GestureDetector(
                  onTap: () => recommandationcontroller.changecurrentpage(1),
                  child: TRoundedContainer(
                    height: 40,
                    width: 107,
                    radius: Tsizes.sm,
                    showborder: recommandationcontroller.currentindex.value == 1
                        ? false
                        : true,
                    backgroundColor:
                        recommandationcontroller.currentindex.value == 1
                            ? Tcolors.primary
                            : Colors.transparent,
                    padding: const EdgeInsets.all(Tsizes.sm),
                    child: Center(
                        child: Text(
                      "Drinks",
                      style: TextStyle(
                        color: recommandationcontroller.currentindex.value == 1
                            ? Tcolors.white
                            : null,
                      ),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                width: Tsizes.md,
              ),
              Obx(
                () => GestureDetector(
                  onTap: () => recommandationcontroller.changecurrentpage(2),
                  child: TRoundedContainer(
                    showborder: recommandationcontroller.currentindex.value == 2
                        ? false
                        : true,
                    height: 40,
                    width: 107,
                    radius: Tsizes.sm,
                    backgroundColor:
                        recommandationcontroller.currentindex.value == 2
                            ? Tcolors.primary
                            : Colors.transparent,
                    padding: const EdgeInsets.all(Tsizes.sm),
                    child: Center(
                        child: Text(
                      "Training",
                      style: TextStyle(
                        color: recommandationcontroller.currentindex.value == 2
                            ? Tcolors.white
                            : null,
                      ),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Current page

        Obx(
          () => recommandationcontroller
              .pages[recommandationcontroller.currentindex.value],
        ),
      ],
    );
  }
}
