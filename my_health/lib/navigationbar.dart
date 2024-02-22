import 'package:my_health/features/myhealth/screens/bot/bot.dart';
import 'package:my_health/features/myhealth/screens/support/doctor.dart';
import 'package:my_health/features/myhealth/screens/home/homepage/home.dart';
import 'package:my_health/features/myhealth/screens/recommandations/recommmandatios.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController controller = Get.put(NavigationController());
    final darkmode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: darkmode ? Tcolors.dark : null,
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          backgroundColor: darkmode ? Tcolors.dark : null,
          indicatorColor: Tcolors.primary.withOpacity(0.6),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.message), label: "Chat"),
            NavigationDestination(
                icon: Icon(Iconsax.hospital), label: "Support"),
            NavigationDestination(
                icon: Icon(Iconsax.heart), label: "Suggestions"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final List<Widget> screens = [
    const MyHealthHomeScreen(),
    const MyHealthBotScreen(),
    const MyHealthDoctorScreen(),
    const MyHealthReccommandationScreen(),
  ];
}
