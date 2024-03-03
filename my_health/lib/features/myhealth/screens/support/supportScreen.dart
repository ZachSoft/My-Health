import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/primary_header_container.dart';
import 'package:my_health/commons/widgets/texts/Section_heading.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/appbar.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/category.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/doctors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';

class MyHealthSupportScreen extends StatelessWidget {
  const MyHealthSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const THeaderContainer(
                child: Padding(
              padding: EdgeInsets.only(bottom: Tsizes.spaceBtwSections * 2),
              child: MyDoctorAppbar(),
            )),
            Padding(
              padding: const EdgeInsets.all(Tsizes.defaultSpace),
              child: Column(
                children: [
                  // Search
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.search_normal),
                          hintText: "Search anything",
                        ),
                      ),
                    ],
                  )),

                  const SizedBox(
                    height: Tsizes.spaceBtwSections,
                  ),

                  // Categories

                  const TsectionHeading(headingtitle: "Categories"),

                  const SizedBox(
                    height: Tsizes.spaceBtwItems * 2,
                  ),

                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        // Element

                        CategoryWidget(
                            title: "Doctor", image: TImagestring.doctor),
                        SizedBox(
                          width: Tsizes.md,
                        ),

                        CategoryWidget(title: "Drug", image: TImagestring.drug),
                        SizedBox(
                          width: Tsizes.md,
                        ),

                        CategoryWidget(
                            title: "Community", image: TImagestring.group),
                        SizedBox(
                          width: Tsizes.md,
                        ),

                        CategoryWidget(
                            title: "Insulin", image: TImagestring.insulin),
                        SizedBox(
                          width: Tsizes.md,
                        ),
                      ],
                    ),
                  ),

                  // Nearest doctors

                  const SizedBox(
                    height: Tsizes.spaceBtwSections,
                  ),

                  const TsectionHeading(
                    headingtitle: "Nearest Doctors",
                    showactionbtn: true,
                  ),

                  const SizedBox(
                    height: Tsizes.spaceBtwItems * 2,
                  ),

                  const Doctors(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
