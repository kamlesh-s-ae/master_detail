import 'package:master_detail/item.dart';
import 'package:flutter/material.dart';

class ItemListing extends StatelessWidget {
  const ItemListing({super.key,
    required this.itemSelectedCallback,
    required this.selectedItem,
  });

  final ValueChanged<Item> itemSelectedCallback;
  final Item selectedItem;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: items.map((item) {
        return ListTile(
          title: Text(item.title),
          onTap: () => itemSelectedCallback(item),
          selected: selectedItem == item,
        );
      }).toList(),
    );
  }
}
