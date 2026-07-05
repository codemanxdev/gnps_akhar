import 'dart:math';
import 'package:flutter/material.dart';

/// Draws an illustrated forest scene behind the lesson path: a soft green
/// gradient, a wide dirt-path swath following the same points the lesson
/// nodes connect through, and scattered trees/bushes on either side.
///
/// Trees are kept clear of the path by only placing them outside a band
/// around the path's horizontal centerline — cheap to compute and good
/// enough since the path only wanders within a fixed amplitude (see
/// LessonPath._horizontalAmplitude).
class ForestBackgroundPainter extends CustomPainter {
  final List<Offset> pathPoints;
  final double centerX;
  final double pathClearance;

  ForestBackgroundPainter({
    required this.pathPoints,
    required this.centerX,
    this.pathClearance = 130,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _paintBackground(canvas, size);
    _paintDirtPath(canvas);
    _paintScenery(canvas, size);
  }

  void _paintBackground(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final gradientPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFEFF8E8), Color(0xFFDCEFC9)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(rect);
    canvas.drawRect(rect, gradientPaint);
  }

  void _paintDirtPath(Canvas canvas) {
    if (pathPoints.length < 2) return;

    final path = Path()..moveTo(pathPoints.first.dx, pathPoints.first.dy);
    for (final point in pathPoints.skip(1)) {
      path.lineTo(point.dx, point.dy);
    }

    final widePaint = Paint()
      ..color = const Color(0xFFE3CFA3).withValues(alpha: 0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 52
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPath(path, widePaint);
  }

  void _paintScenery(Canvas canvas, Size size) {
    final random = Random(7); // fixed seed: stable layout across rebuilds
    final leftBandMax = (centerX - pathClearance).clamp(20.0, size.width);
    final rightBandMin = (centerX + pathClearance).clamp(0.0, size.width - 20);

    const verticalStep = 90.0;
    for (double y = 20; y < size.height; y += verticalStep) {
      if (random.nextDouble() < 0.75 && leftBandMax > 30) {
        final x = random.nextDouble() * (leftBandMax - 30) + 10;
        _paintTreeOrBush(
          canvas,
          Offset(x, y + random.nextDouble() * 40),
          random,
        );
      }
      if (random.nextDouble() < 0.75 && rightBandMin < size.width - 30) {
        final x =
            rightBandMin +
            random.nextDouble() * (size.width - rightBandMin - 30);
        _paintTreeOrBush(
          canvas,
          Offset(x, y + random.nextDouble() * 40),
          random,
        );
      }
    }
  }

  void _paintTreeOrBush(Canvas canvas, Offset base, Random random) {
    final isBush = random.nextBool();
    if (isBush) {
      _paintBush(canvas, base, 18 + random.nextDouble() * 10);
    } else {
      _paintTree(canvas, base, 26 + random.nextDouble() * 16);
    }
  }

  void _paintTree(Canvas canvas, Offset base, double foliageRadius) {
    final trunkPaint = Paint()..color = const Color(0xFF8B6A4A);
    final trunkRect = Rect.fromCenter(
      center: Offset(base.dx, base.dy + foliageRadius * 0.6),
      width: foliageRadius * 0.35,
      height: foliageRadius * 1.1,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(trunkRect, const Radius.circular(3)),
      trunkPaint,
    );

    final foliageColors = [
      const Color(0xFF6FA85C),
      const Color(0xFF5C9650),
      const Color(0xFF80B86A),
    ];
    for (int i = 0; i < 3; i++) {
      final paint = Paint()..color = foliageColors[i % foliageColors.length];
      final offset = Offset(
        base.dx + (i - 1) * foliageRadius * 0.35,
        base.dy - foliageRadius * 0.3 - i * foliageRadius * 0.15,
      );
      canvas.drawCircle(offset, foliageRadius * (1 - i * 0.12), paint);
    }
  }

  void _paintBush(Canvas canvas, Offset base, double radius) {
    final colors = [const Color(0xFF7BB566), const Color(0xFF669C55)];
    for (int i = 0; i < 3; i++) {
      final paint = Paint()..color = colors[i % colors.length];
      final offset = Offset(base.dx + (i - 1) * radius * 0.6, base.dy);
      canvas.drawCircle(offset, radius * 0.7, paint);
    }
  }

  @override
  bool shouldRepaint(covariant ForestBackgroundPainter oldDelegate) =>
      oldDelegate.pathPoints != pathPoints || oldDelegate.centerX != centerX;
}
