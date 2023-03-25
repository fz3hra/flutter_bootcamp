import 'package:flutter/material.dart';

extension AddPadding on Container {
  Container addPadding() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 48,
      ),
      child: this,
    );
  }
}
