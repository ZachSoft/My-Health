import 'package:flutter/material.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/utils/constants/sizes.dart';

class Metric extends StatelessWidget {
  const Metric({
    super.key,
    required this.image,
    required this.title,
    required this.backgroundColor,
    required this.number,
    required this.updated,
    required this.type,
    this.ontap,
  });

  final String image;
  final String title;
  final String type;
  final Color backgroundColor;
  final String number;
  final String updated;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: TRoundedContainer(
        height: 114,
        width: double.infinity,
        radius: Tsizes.Lg,
        padding: const EdgeInsets.all(Tsizes.Lg),
        backgroundColor: backgroundColor.withOpacity(0.15),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Image(image: AssetImage(image)),
              ),
              const SizedBox(
                width: Tsizes.spaceBtwItems,
              ),
              Expanded(
                flex: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: Tsizes.sm / 1.5,
                    ),
                    Row(
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: number,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: type,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ])),
                        const SizedBox(
                          width: Tsizes.md,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 125,
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                  text: "Last updated: ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                  text: updated,
                                  style: Theme.of(context).textTheme.labelSmall,
                                )
                              ]),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: Tsizes.iconSm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
