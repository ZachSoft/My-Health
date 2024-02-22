
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/utils/constants/sizes.dart';

class TprofileMenu extends StatelessWidget {
  const TprofileMenu({
    super.key,
    this.ontap,
    required this.title,
    required this.value,
    this.icon = Iconsax.arrow_right_34,
  });

  final VoidCallback? ontap;
  final String title, value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Tsizes.spaceBtwItems / 2),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )),
            Expanded(
                flex: 5,
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )),
            Expanded(
                child: Icon(
              icon,
              size: 18,
            )),
          ],
        ),
      ),
    );
  }
}
