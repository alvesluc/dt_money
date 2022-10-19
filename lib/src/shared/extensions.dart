import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension BreakpointUtils on BoxConstraints {
  bool get isTablet => maxWidth > 720;
  bool get isDesktop => maxWidth > 1120;
  bool get isMobile => !isTablet && !isDesktop;
}

extension ToReal on double {
  String toCurrency() {
    if(this == 0) return '0,00';
    return NumberFormat('#,###.00', 'pt_BR').format(this);
  }
}
