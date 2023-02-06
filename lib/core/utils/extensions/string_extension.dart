import 'package:flutter/foundation.dart';

extension ArabicStrings on String {
  String get arabicText => '${Unicode.RLO}$this';
}
