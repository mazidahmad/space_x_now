import 'package:flutter/material.dart';

import '../../ui_components.dart';

class AppTextItem extends StatelessWidget {
  const AppTextItem({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.mediumLabel(),
        ),
        Text(
          value,
          style: AppTextStyle.headline4(),
        ),
      ],
    );
  }
}

class AppSmallTextItem extends StatelessWidget {
  const AppSmallTextItem({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.smallLabel(),
        ),
        Text(
          value,
          textAlign: TextAlign.justify,
          style: AppTextStyle.body14(),
        ),
      ],
    );
  }
}
