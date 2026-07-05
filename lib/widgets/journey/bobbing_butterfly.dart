import 'dart:math';
import 'package:flutter/material.dart';

/// A small butterfly that drifts in a loose, looping flutter path using two
/// out-of-phase sine waves. Purely decorative, positioned absolutely by the
/// parent (see LessonPath).
class BobbingButterfly extends StatefulWidget {
  final double size;
  final Duration period;
  final Color color;

  const BobbingButterfly({
    super.key,
    this.size = 26,
    this.period = const Duration(seconds: 4),
    this.color = Colors.orangeAccent,
  });

  @override
  State<BobbingButterfly> createState() => _BobbingButterflyState();
}

class _BobbingButterflyState extends State<BobbingButterfly>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.period,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value * 2 * pi;
        final dx = 10 * sin(t);
        final dy = 6 * sin(t * 1.7);
        final wingFlap =
            1 + 0.15 * sin(t * 6); // quick flutter, independent of drift
        return Transform.translate(
          offset: Offset(dx, dy),
          child: Transform.scale(scaleX: wingFlap, child: child),
        );
      },
      child: Icon(Icons.flutter_dash, color: widget.color, size: widget.size),
    );
  }
}
