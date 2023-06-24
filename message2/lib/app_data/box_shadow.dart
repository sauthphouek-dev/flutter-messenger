import 'package:flutter/material.dart';

class CardBoxShadow {
  static List<BoxShadow> primaryShadow = [
    BoxShadow(
      blurRadius: 4,
      offset: const Offset(4, 4),
      color: Colors.grey.shade300,
    ),
    const BoxShadow(
      blurRadius: 4,
      offset: Offset(-4, -4),
      color: Colors.white,
    ),
  ];
}
