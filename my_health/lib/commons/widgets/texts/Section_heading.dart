import 'package:flutter/material.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';

class TsectionHeading extends StatelessWidget {
  const TsectionHeading({
    super.key,
    required this.headingtitle,
    this.onPressed,
    this.showactionbtn = false,
    this.titlecolor,
  });

  final String headingtitle;
  final VoidCallback? onPressed;
  final bool showactionbtn;
  final Color? titlecolor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headingtitle,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: titlecolor, fontWeight: FontWeight.w800),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showactionbtn)
          GestureDetector(
            onTap: onPressed,
            child: const TRoundedContainer(
              padding: EdgeInsets.symmetric(
                  horizontal: Tsizes.md, vertical: Tsizes.sm / 16),
              backgroundColor: Tcolors.black,
              child: Icon(
                Icons.more_horiz,
                color: Tcolors.white,
              ),
            ),
          )
      ],
    );
  }
}
