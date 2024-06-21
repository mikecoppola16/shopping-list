import 'package:flutter/material.dart';
import 'package:shopping_list_app/features/shopping_list/domain/entities/grocery_item_entity.dart';

class GroceryListTile extends ListTile {
  const GroceryListTile({super.key, required this.item, required this.ctx});

  final GroceryItemEntity item;
  final BuildContext ctx;

  @override
  Widget? get leading => Container(
        height: 30,
        width: 30,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: item.category?.color,
          shape: BoxShape.rectangle,
        ),
      );

  @override
  Widget? get title => Text(
        item.name!,
        style: Theme.of(ctx)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      );

  @override
  Widget? get trailing => Text(
        item.quantity.toString(),
        style: Theme.of(ctx)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      );
}
