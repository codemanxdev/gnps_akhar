import 'package:flutter/material.dart';

import '../../models/shop_item.dart';

/// Renders a user's avatar in a tall, figure-like arrangement: turban up
/// top (head), base body filling the center, clothes overlapping the
/// lower half, and an accessory badge to the side. Since items are
/// IconData + Color (not body-part artwork), this is a stylized layout
/// rather than true anatomical layering — but it reads as "a figure"
/// rather than a small icon cluster.
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

  @override
  Widget build(BuildContext context) {
    final base = _resolve(AvatarSlot.base);
    final turban = _resolve(AvatarSlot.turban);
    final clothes = _resolve(AvatarSlot.clothes);
    final accessory = _resolve(AvatarSlot.accessory);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final bodySize = width * 0.85;
        final turbanSize = width * 0.4;
        final clothesSize = width * 0.4;
        final accessorySize = width * 0.3;

        return Stack(
          alignment: Alignment.center,
          children: [
            // Body — large, centered, dominates the canvas.
            Positioned(
              top: height * 0.14,
              child: Container(
                width: bodySize,
                height: bodySize,
                decoration: BoxDecoration(
                  color: (base?.color ?? Colors.grey.shade300).withValues(
                    alpha: 0.18,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  base?.icon ?? Icons.person,
                  size: bodySize * 0.68,
                  color: base?.color ?? Colors.grey.shade600,
                ),
              ),
            ),
            // Turban — sits on top like a head-slot item.
            if (turban != null)
              Positioned(
                top: 0,
                child: _SlotBadge(item: turban, size: turbanSize),
              ),
            // Clothes — overlaps the lower body.
            if (clothes != null)
              Positioned(
                bottom: height * 0.06,
                child: _SlotBadge(item: clothes, size: clothesSize),
              ),
            // Accessory — floats beside the body, like glasses/jewelry.
            if (accessory != null)
              Positioned(
                top: height * 0.32,
                right: width * 0.02,
                child: _SlotBadge(item: accessory, size: accessorySize),
              ),
          ],
        );
      },
    );
  }
}

class _SlotBadge extends StatelessWidget {
  final ShopItem item;
  final double size;

  const _SlotBadge({required this.item, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: item.color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: Icon(item.icon, size: size * 0.6, color: Colors.white),
    );
  }
}
