import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../config/reward_config.dart';
import '../../models/shop_item.dart';

class ShopItemCard extends StatelessWidget {
  final ShopItem item;
  final bool owned;
  final int quantity;
  final bool canAfford;
  final VoidCallback onBuy;

  const ShopItemCard({
    super.key,
    required this.item,
    required this.owned,
    required this.quantity,
    required this.canAfford,
    required this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    final isSoldOut = owned && !item.stackable;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          item.imageAssetPath != null
              ? SvgPicture.asset(item.imageAssetPath!, width: 52, height: 52)
              : Icon(item.icon, color: item.color, size: 52),
          const SizedBox(height: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  item.description,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          if (item.stackable && quantity > 0)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                'Owned: $quantity',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          SizedBox(
            width: double.infinity,
            child: isSoldOut
                ? const OutlinedButton(onPressed: null, child: Text('Owned'))
                : ElevatedButton(
                    onPressed: canAfford ? onBuy : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(RewardConfig.icon, size: 14),
                        const SizedBox(width: 4),
                        Text('${item.price}'),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
