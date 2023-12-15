import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.itemName, required this.itemIcon});

  final String itemName;
  final Icon itemIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
        child: Row(
          children: [
            itemIcon,
            const SizedBox(width: 8),
            Text(itemName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
            ),
          ],
        ),
      ),
    );
  }
}