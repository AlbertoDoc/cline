import 'package:flutter/material.dart';

class Dimens {
  static BoxConstraints get clinicImageConstraint => BoxConstraints(
        maxHeight: 50,
        maxWidth: 100,
      );

  static BoxConstraints get clinicTextConstraint => BoxConstraints(
        maxWidth: 100,
        maxHeight: 50,
      );

  static const double card_width_ratio = 0.5;
  static const double card_height_ratio = 0.1;
  static const double card_border_radius = 20;
  static const double card_padding = 5;
  static const int item_per_row = 3;

  static const double search_box_width = 300;
  static const double search_box_height = 200;
}
