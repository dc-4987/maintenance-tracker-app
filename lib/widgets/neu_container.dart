import 'package:flutter/material.dart';

enum NeuShape { convex, concave, flat }

class Neu extends StatelessWidget {
  final Widget child;
  final double radius;
  final double depth; // visual depth (2–8)
  final Offset light; // light direction
  final Color? color; // base; defaults to theme surface
  final EdgeInsetsGeometry padding;
  final NeuShape shape;

  const Neu({
    super.key,
    required this.child,
    this.radius = 16,
    this.depth = 6,
    this.light = const Offset(4, 4), // bottom-right shadow; top-left highlight
    this.color,
    this.padding = const EdgeInsets.all(12),
    this.shape = NeuShape.convex,
  });

  @override
  Widget build(BuildContext context) {
    final base = color ?? Theme.of(context).colorScheme.surface;
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final darkShadow = Colors.black.withValues(alpha: 0.12);
    final lightShadow = Colors.white.withValues(alpha: 0.8);

    BoxDecoration decoration;

    if (shape == NeuShape.concave) {
      // subtle inner light/dark via gradient to fake an inset look
      decoration = BoxDecoration(
        color: base,
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [base.withValues(alpha: 0.95), base.withValues(alpha: 0.85)],
        ),
        boxShadow: [
          BoxShadow(
            offset: -light / 2,
            blurRadius: depth * 2,
            color: lightShadow,
          ),
          BoxShadow(
            offset: light / 2,
            blurRadius: depth * 2,
            color: darkShadow,
          ),
        ],
      );
    } else if (shape == NeuShape.convex) {
      decoration = BoxDecoration(
        color: base,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(offset: -light, blurRadius: depth * 2, color: lightShadow),
          BoxShadow(offset: light, blurRadius: depth * 2, color: darkShadow),
        ],
      );
    } else {
      decoration = BoxDecoration(
        color: base,
        borderRadius: BorderRadius.circular(radius),
      );
    }

    return Container(
      decoration: decoration,
      child: Padding(
        padding: padding,
        child: DefaultTextStyle.merge(
          style: TextStyle(color: onSurface),
          child: child,
        ),
      ),
    );
  }
}
