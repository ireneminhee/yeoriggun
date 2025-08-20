import 'package:flutter/material.dart';
import 'local_svg_icon.dart';

// 로컬 SVG 서버를 사용한 카테고리 아이콘들

class SeafoodIcon extends StatelessWidget {
  final double size;
  final Color color;

  const SeafoodIcon({
    super.key,
    this.size = 18,
    this.color = const Color(0xFFFFFDFB),
  });

  @override
  Widget build(BuildContext context) {
    return LocalSvgIcon(
      'seafood',
      size: size,
      color: color,
    );
  }
}

class CookedIcon extends StatelessWidget {
  final double size;
  final Color color;

  const CookedIcon({
    super.key,
    this.size = 18,
    this.color = const Color(0xFFFFFDFB),
  });

  @override
  Widget build(BuildContext context) {
    return LocalSvgIcon(
      'cooked',
      size: size,
      color: color,
    );
  }
}

class VegieIcon extends StatelessWidget {
  final double size;
  final Color color;

  const VegieIcon({
    super.key,
    this.size = 18,
    this.color = const Color(0xFFFFFDFB),
  });

  @override
  Widget build(BuildContext context) {
    return LocalSvgIcon(
      'vegetable',
      size: size,
      color: color,
    );
  }
}

class SeasoningIcon extends StatelessWidget {
  final double size;
  final Color color;

  const SeasoningIcon({
    super.key,
    this.size = 18,
    this.color = const Color(0xFFFFFDFB),
  });

  @override
  Widget build(BuildContext context) {
    return LocalSvgIcon(
      'seasoning',
      size: size,
      color: color,
    );
  }
}

class HealthIcon extends StatelessWidget {
  final double size;
  final Color color;

  const HealthIcon({
    super.key,
    this.size = 18,
    this.color = const Color(0xFFFFFDFB),
  });

  @override
  Widget build(BuildContext context) {
    return LocalSvgIcon(
      'health',
      size: size,
      color: color,
    );
  }
}
