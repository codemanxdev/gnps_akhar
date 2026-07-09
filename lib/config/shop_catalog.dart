import 'package:flutter/material.dart';

import '../models/shop_item.dart';

/// The full list of items available in the shop. Add new items here —
/// nothing else needs to change for a new item to show up, since
/// ShopScreen renders this list directly and groups it by category.
const List<ShopItem> shopCatalog = [
  ShopItem(
    id: 'avatar_golden',
    name: 'Golden Mascot',
    description: 'A shiny golden look for your mascot.',
    icon: Icons.stars,
    color: Colors.amber,
    price: 150,
    category: ShopItemCategory.avatar,
  ),
  ShopItem(
    id: 'avatar_ninja',
    name: 'Ninja Mascot',
    description: 'Sneaky and stealthy, for focused learners.',
    icon: Icons.theater_comedy,
    color: Colors.indigo,
    price: 150,
    category: ShopItemCategory.avatar,
  ),
  ShopItem(
    id: 'avatar_royal',
    name: 'Royal Mascot',
    description: 'Fit for a Gurmukhi champion.',
    icon: Icons.emoji_events,
    color: Colors.deepPurple,
    price: 250,
    category: ShopItemCategory.avatar,
  ),
  ShopItem(
    id: 'powerup_streak_freeze',
    name: 'Streak Freeze',
    description: 'Protects your streak if you miss a day.',
    icon: Icons.ac_unit,
    color: Colors.lightBlue,
    price: 50,
    category: ShopItemCategory.powerUp,
    stackable: true,
  ),
];
