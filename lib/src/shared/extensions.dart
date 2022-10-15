import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension BreakpointUtils on BoxConstraints {
  bool get isTablet => maxWidth > 730;
  bool get isDesktop => maxWidth > 1200;
  bool get isMobile => !isTablet && !isDesktop;
}

extension ToReal on double {
  String toCurrency() {
    return NumberFormat('#,###.00', 'pt_BR').format(this);
  }
}
