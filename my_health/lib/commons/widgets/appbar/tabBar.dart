
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/device/device_utility.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class TtabBar extends StatelessWidget implements PreferredSizeWidget {
  const TtabBar({super.key, required this.tabs});

  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? Tcolors.dark : Tcolors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: Tcolors.primary,
        labelColor: dark ? Tcolors.white : Tcolors.primary,
        unselectedLabelColor: Tcolors.darkGrey,
        tabs: tabs,
      ),
    );
  }

  @override

  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
