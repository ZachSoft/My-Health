
import 'package:my_health/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TsettingMenutile extends StatelessWidget {
  const TsettingMenutile({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.ontap,
    this.trailing,
    this.showsubtitle = true,
  });

  final String title;
  final String? subtitle;
  final IconData icon;
  final VoidCallback? ontap;
  final Widget? trailing;
  final bool showsubtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: Tcolors.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: showsubtitle
          ? Text(
              subtitle!,
              style: Theme.of(context).textTheme.labelMedium,
            )
          : null,
      onTap: ontap,
      trailing: trailing,
    );
  }
}
