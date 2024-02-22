import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TcircularLoaderWidget extends StatelessWidget {
  const TcircularLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showActionBtn = false,
      this.actionbtntext,
      this.onactionpressed});

  final String text, animation;
  final bool showActionBtn;
  final String? actionbtntext;
  final VoidCallback? onactionpressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            animation,
            width: TDeviceUtils.getScreenWidth(context) * 0.6,
          ),
          const SizedBox(
            height: Tsizes.spaceBtwItems,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: Tsizes.spaceBtwItems,
          ),
          showActionBtn
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    style:
                        OutlinedButton.styleFrom(backgroundColor: Tcolors.dark),
                    onPressed: onactionpressed,
                    child: Text(
                      actionbtntext!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Tcolors.Light),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
