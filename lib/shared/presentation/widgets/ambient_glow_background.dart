import 'dart:ui';

import 'package:flutter/material.dart';

class AmbientGlowBackground extends StatelessWidget {
  const AmbientGlowBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ColoredBox(
        color: const Color(0xFFF3F3F7),
        child: ClipRect(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 30,
              sigmaY: 30,
              tileMode: TileMode.decal,
            ),
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: FractionalTranslation(
                    translation: Offset(0.3, -0.25),
                    child: AmbientGlowBlob(size: 360, color: Color(0x669A8CFF)),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: FractionalTranslation(
                    translation: Offset(-0.4, -0.1),
                    child: AmbientGlowBlob(size: 420, color: Color(0x665BC8FF)),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionalTranslation(
                    translation: Offset(0.15, 0.45),
                    child: AmbientGlowBlob(size: 800, color: Color(0x66FF88BC)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AmbientGlowBlob extends StatelessWidget {
  const AmbientGlowBlob({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(-0.2, -0.25),
            radius: 1.15,
            colors: [
              color,
              color.withValues(alpha: color.a * 0.55),
              color.withValues(alpha: color.a * 0.18),
              color.withValues(alpha: 0),
            ],
            stops: const [0, 0.28, 0.62, 1],
          ),
        ),
      ),
    );
  }
}
