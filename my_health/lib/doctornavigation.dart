import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorappointement/doctorappointement.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorhome/doctorhome.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorprofile/doctorprofile.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DoctorNavigationMenu extends StatelessWidget {
  const DoctorNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationDoctorController());

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
            NavigationDestination(
                icon: Icon(Iconsax.activity), label: "Appointements"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationDoctorController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final List<Widget> screens = [
    const DoctorHomeScreen(),
    const DoctorAppointementScreen(),
    const DoctorProfileScreen(),
  ];
}
