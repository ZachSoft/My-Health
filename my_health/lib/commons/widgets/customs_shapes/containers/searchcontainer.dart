// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:flutter/material.dart';
// import 'package:my_health/features/personalisation/controllers/controllers/admincontroller/addrecommandationcontroller/addrecommandationcontroller.dart';
// import 'package:my_health/features/personalisation/models/recommandations/recommandationmodel.dart';

// class Tsearchcontainer extends StatelessWidget {
//   const Tsearchcontainer({
//     super.key,
//     required this.items,
//   });
//   final List<RecommandationModel> items;
//   @override
//   Widget build(BuildContext context) {
//     final searchcontroller = Get.put(RecommandationController());
//     return Form(
//       child: TextField(
//         controller: searchcontroller.searchcontroller,
//         decoration: const InputDecoration(
//             prefixIcon: Icon(Iconsax.search_normal), hintText: "Search here"),
//         onChanged: (value) => searchcontroller.searchbook(value, items),
//       ),
//     );
//   }
// }
