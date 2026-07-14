import 'package:flutter/material.dart';

class GameNode extends StatelessWidget {
  final String title;
  final bool isLocked;
  final VoidCallback? onTap;

  const GameNode({
    super.key,
    required this.title,
    this.isLocked = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLocked ? null : onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: isLocked ? Colors.grey.shade300 : Colors.amber.shade400,
              shape: BoxShape.circle,
              boxShadow: [
                if (!isLocked)
                  BoxShadow(
                    color: Colors.amber.withValues(alpha: 0.4),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
              ],
              border: Border.all(
                color: isLocked ? Colors.grey.shade400 : Colors.amber.shade700,
                width: 3,
              ),
            ),
            child: Icon(
              isLocked ? Icons.lock : Icons.videogame_asset,
              color: isLocked ? Colors.grey.shade600 : Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
