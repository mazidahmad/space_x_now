import 'package:flutter/material.dart';

import '../../ui_components.dart';

class AppCircularIconButton extends StatelessWidget {
  const AppCircularIconButton({
    super.key,
    this.size = 20,
    this.isDisabled = false,
    required this.icon,
    this.color = AppColors.light4,
    this.onTap,
    this.iconColor = AppColors.dark1,
  });

  final double size;
  final bool isDisabled;
  final IconData icon;
  final void Function()? onTap;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: isDisabled ? AppColors.dark2 : color,
            borderRadius: BorderRadius.circular(size)),
        child: Icon(
          icon,
          size: size,
          color: iconColor,
        ),
      ),
    );
  }
}
