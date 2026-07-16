import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/shop_item.dart';

class AvatarPreview extends StatelessWidget {
  final Map<String, String> equippedItemIds;
  final List<ShopItem> catalog;

  const AvatarPreview({
    super.key,
    required this.equippedItemIds,
    required this.catalog,
  });

  ShopItem? _resolve(AvatarSlot slot) {
    final itemId = equippedItemIds[slot.name];
    if (itemId == null) return null;
    for (final item in catalog) {
      if (item.id == itemId) return item;
    }
    return null;
  }

  // "None" sentinel items exist so the shop/equip system always has a
  // valid default, but they shouldn't render a visible badge.
  bool _isVisible(ShopItem? item) {
    if (item == null) return false;
    return item.id != DefaultItemIds.turbanNone &&
        item.id != DefaultItemIds.accessoryNone;
  }

  @override
  Widget build(BuildContext context) {
    final base = _resolve(AvatarSlot.base);
    final turban = _resolve(AvatarSlot.turban);
    final clothes = _resolve(AvatarSlot.clothes);
    final accessory = _resolve(AvatarSlot.accessory);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = width * 1.25; // 4:5 ratio (e.g. 200x250)

        return SizedBox(
          width: width,
          height: height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 1. Base Body
              if (base?.imageAssetPath != null)
                SvgPicture.asset(base!.imageAssetPath!, fit: BoxFit.contain)
              else
                Center(
                  child: Icon(
                    base?.icon ?? Icons.person,
                    size: width * 0.6,
                    color: base?.color ?? Colors.grey.shade600,
                  ),
                ),

              // 2. Clothes
              if (clothes != null)
                _Layer(item: clothes),

              // 3. Accessory (Glasses, etc.)
              if (_isVisible(accessory))
                _Layer(item: accessory!),

              // 4. Turban (On top)
              if (_isVisible(turban))
                _Layer(item: turban!),
            ],
          ),
        );
      },
    );
  }
}

class _Layer extends StatelessWidget {
  final ShopItem item;

  const _Layer({required this.item});

  @override
  Widget build(BuildContext context) {
    if (item.imageAssetPath != null) {
      return SvgPicture.asset(item.imageAssetPath!, fit: BoxFit.contain);
    }
    // Fallback for non-SVG items (unlikely for layers, but kept for safety)
    return Center(
      child: Icon(item.icon, size: 40, color: item.color),
    );
  }
}
