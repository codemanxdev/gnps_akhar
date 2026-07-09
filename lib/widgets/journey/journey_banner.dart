import 'package:flutter/material.dart';
import 'package:gnps_akhar/config/reward_config.dart';

import '../../screens/streak_screen.dart';

/// A compact strip on the Journey screen: a friendly greeting on the left,
/// streak + points at a glance on the right.
class JourneyBanner extends StatelessWidget {
  final int streak;
  final int points;

  const JourneyBanner({super.key, required this.streak, required this.points});

  void _openStreakScreen(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const StreakScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hi there! 👋',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => _openStreakScreen(context),
                child: _StatPill(
                  icon: Icons.local_fire_department,
                  color: Colors.orange,
                  value: '$streak',
                ),
              ),
              const SizedBox(width: 12),
              _StatPill(
                icon: RewardConfig.icon,
                color: RewardConfig.color,
                value: '$points',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatPill extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String value;

  const _StatPill({
    required this.icon,
    required this.color,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 6),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
