import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class TappBar extends StatelessWidget implements PreferredSizeWidget {
  const TappBar(
      {super.key,
      this.leadingOnpressed,
      this.showbackarrow = false,
      this.leadingIcon,
      this.actions,
      this.title,
      this.centertitle = false,
      this.bottom});

  final VoidCallback? leadingOnpressed;
  final bool showbackarrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final Widget? title;
  final bool centertitle;
  final PreferredSizeWidget? bottom;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Tsizes.md,
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: centertitle ? true : false,
        leading: showbackarrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnpressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottom != null
      ? TDeviceUtils.getAppBarHeight() * 2
      : TDeviceUtils.getAppBarHeight());
}
