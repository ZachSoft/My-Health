import 'package:flutter/material.dart';
import 'package:my_health/commons/widgets/images/TcircularImage.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';

class MyHealthBotAppBar extends StatelessWidget {
  const MyHealthBotAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Ai Doctor",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w600, color: Tcolors.white),
          ),
          Text("Online",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Tcolors.white)),
        ],
      ),
      leading: const TcircularImage(
        width: 56,
        height: 56,
        image: TImagestring.myAidoctorprofile,
        fit: BoxFit.cover,
        padding: 0,
      ),
    );
  }
}
