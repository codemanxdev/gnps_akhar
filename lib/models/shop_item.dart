import 'package:flutter/material.dart';

/// Broad grouping used to organize the shop UI into sections. Add more
/// categories here as new kinds of items are introduced.
enum ShopItemCategory { avatar, powerUp }

/// A single purchasable item.
///
/// [stackable] controls purchase behavior:
/// - false (default): a one-time unlock, e.g. a cosmetic avatar. Once
///   owned, the shop shows "Owned" instead of a buy button.
/// - true: can be purchased repeatedly to accumulate a quantity, e.g. a
///   streak freeze that gets consumed over time.
class ShopItem {
  final String id;
  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final int price;
  final ShopItemCategory category;
  final bool stackable;

  const ShopItem({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.price,
    required this.category,
    this.stackable = false,
  });
}
