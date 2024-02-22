import 'package:flutter/material.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/utils/constants/sizes.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.title, required this.image});

  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TRoundedContainer(
          showborder: true,
          padding: const EdgeInsets.all(Tsizes.md),
          width: 75,
          backgroundColor: Colors.transparent,
          height: 75,
          child: Image(image: AssetImage(image)),
        ),
        const SizedBox(
          height: Tsizes.sm / 2,
        ),
        SizedBox(
          width: 75,
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
