// import 'package:my_health/bindings/general_bindings.dart';
// import 'package:my_health/routes/app_routes.dart';
import 'package:my_health/bindings/general_bindings.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TApptheme.lighttheme,
      darkTheme: TApptheme.darktheme,
      themeMode: ThemeMode.system,
      initialBinding: GeneralBindings(),
      // getPages: AppRoutes.pages,
      home: Scaffold(
        body: Container(
          color: Tcolors.primary,
          child: const Center(
            child: CircularProgressIndicator(
              color: Tcolors.white,
            ),
          ),
        ),
      ),
    );
  }
}
