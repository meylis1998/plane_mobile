import 'package:flutter/material.dart';

/// Border radius constants for the Plane app.
abstract final class PlaneRadius {
  // Raw values
  static const double smValue = 4;
  static const double mdValue = 8;
  static const double lgValue = 12;
  static const double xlValue = 16;
  static const double fullValue = 999;

  // BorderRadius
  static const BorderRadius sm = BorderRadius.all(Radius.circular(smValue));
  static const BorderRadius md = BorderRadius.all(Radius.circular(mdValue));
  static const BorderRadius lg = BorderRadius.all(Radius.circular(lgValue));
  static const BorderRadius xl = BorderRadius.all(Radius.circular(xlValue));
  static const BorderRadius full =
      BorderRadius.all(Radius.circular(fullValue));

  // Circular Radius (for use in shapes)
  static const Radius circularSm = Radius.circular(smValue);
  static const Radius circularMd = Radius.circular(mdValue);
  static const Radius circularLg = Radius.circular(lgValue);
  static const Radius circularXl = Radius.circular(xlValue);
}
