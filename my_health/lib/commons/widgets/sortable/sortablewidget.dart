import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SortableWidget extends StatelessWidget {
  const SortableWidget({
    super.key,
    required this.items,
    this.onChange,
  });

  final List<String> items;
  final Function(String value)? onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          elevation: 2,
          onChanged: (value) => onChange != null ? onChange!(value!) : null,
          value: items[0],
          items: items
              .map((option) => DropdownMenuItem(
                  value: option,
                  child: Text(
                    option,
                    style: Theme.of(context).textTheme.labelLarge,
                  )))
              .toList(),
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
      ],
    );
  }
}
