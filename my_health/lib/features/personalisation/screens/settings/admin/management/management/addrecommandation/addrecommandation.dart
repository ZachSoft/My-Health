import 'package:get/get.dart';
import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/sortablewidget.dart';
import 'package:my_health/features/personalisation/controllers/controllers/admincontroller/addrecommandationcontroller/addrecommandationcontroller.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

import 'package:my_health/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddRecommandationScreen extends StatelessWidget {
  const AddRecommandationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    // ========controllers========//
    final controller = Get.put(RecommandationController());

    return Scaffold(
      appBar: TappBar(
        showbackarrow: true,
        title: Text(
          "Add a recommandation",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultSpace),
          child: Form(
              key: controller.recommandationFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.name,
                    validator: (value) =>
                        TValidator.validatePlainText("Name", value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.archive), labelText: "Name"),
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwInputFields,
                  ),

                  Text(
                    "Type",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwInputFields,
                  ),
                  SortableWidget(
                    onChange: (value) => controller.changeMealSelection(value),
                    items: const ["Meal", "Drink", "Training"],
                  ),

                  const SizedBox(
                    height: Tsizes.spaceBtwInputFields,
                  ),

                  TextFormField(
                    controller: controller.description,
                    validator: (value) =>
                        TValidator.validatePlainText("the description", value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.activity),
                        labelText: "Description"),
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwInputFields,
                  ),

                  Obx(() {
                    return controller.ismealselected.value
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nutritional values",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const SizedBox(
                                height: Tsizes.spaceBtwInputFields,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: controller.calories,
                                      validator: (value) =>
                                          TValidator.validatePlainText(
                                              "Calories", value),
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Iconsax.activity),
                                          labelText: "Calories"),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: Tsizes.spaceBtwInputFields,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: controller.fiber,
                                      validator: (value) =>
                                          TValidator.validatePlainText(
                                              "Fiber", value),
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Iconsax.activity),
                                          labelText: "Fiber"),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: Tsizes.spaceBtwInputFields,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: controller.glycemicIndex,
                                      validator: (value) =>
                                          TValidator.validatePlainText(
                                              "Glycemic Index", value),
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Iconsax.activity),
                                          labelText: "Glycemic index"),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: Tsizes.spaceBtwInputFields,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: controller.protein,
                                      validator: (value) =>
                                          TValidator.validatePlainText(
                                              "Protein", value),
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Iconsax.activity),
                                          labelText: "Protein"),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: Tsizes.spaceBtwInputFields,
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Drink and sport training
                              Text(
                                "Advantages",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const SizedBox(
                                height: Tsizes.spaceBtwInputFields,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: controller.value1,
                                      validator: (value) =>
                                          TValidator.validatePlainText(
                                              "Value 1", value),
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Iconsax.activity),
                                          labelText: "Value 1"),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: Tsizes.spaceBtwInputFields,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: controller.value2,
                                      validator: (value) =>
                                          TValidator.validatePlainText(
                                              "Value 2", value),
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Iconsax.activity),
                                          labelText: "Value2"),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: Tsizes.spaceBtwInputFields,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: controller.value3,
                                      validator: (value) =>
                                          TValidator.validatePlainText(
                                              "Value 3", value),
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Iconsax.activity),
                                          labelText: "Value 3"),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: Tsizes.spaceBtwInputFields,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: controller.value4,
                                      validator: (value) =>
                                          TValidator.validatePlainText(
                                              "Value 4", value),
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Iconsax.activity),
                                          labelText: "Value 4"),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: Tsizes.spaceBtwInputFields,
                              ),
                            ],
                          );
                  }),

                  // Image preview before upload

                  Obx(() {
                    return controller.isLoading.value == false
                        ? GestureDetector(
                            onTap: () => controller
                                .previewRecommandationImageBeforeUpload(),
                            child: Center(
                              child: TRoundedContainer(
                                height: 120,
                                backgroundColor: dark
                                    ? Tcolors.black
                                    : Tcolors.grey.withOpacity(0.4),
                                showborder: true,
                                child: const Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Iconsax.image,
                                        size: Tsizes.iconLg,
                                      ),
                                      SizedBox(
                                        height: Tsizes.sm,
                                      ),
                                      Text("Select an image"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: TRoundedContainer(
                              height: 100,
                              showborder: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.file(
                                  RecommandationController.imagePreview!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                  }),

                  const SizedBox(
                    height: Tsizes.spaceBtwInputFields,
                  ),
                  // Posting the product
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => controller.saveRecommandation(),
                        child: const Text("Post")),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
