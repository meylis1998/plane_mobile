import 'package:flutter/material.dart';

/// Elevation shadow styles for the Plane app.
abstract final class PlaneShadows {
  static const List<BoxShadow> none = [];

  static const List<BoxShadow> sm = [
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 2,
      offset: Offset(0, 1),
    ),
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  static const List<BoxShadow> md = [
    BoxShadow(
      color: Color(0x0F000000),
      blurRadius: 6,
      offset: Offset(0, 2),
    ),
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 10,
      offset: Offset(0, 4),
    ),
  ];

  static const List<BoxShadow> lg = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 10,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 20,
      offset: Offset(0, 8),
    ),
  ];
}
