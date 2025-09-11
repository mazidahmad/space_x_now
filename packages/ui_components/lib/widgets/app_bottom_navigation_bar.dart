import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar(
      {super.key, required this.items, this.currentIndex, this.onTap});

  final void Function(int)? onTap;
  final int? currentIndex;
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex ?? 0,
        onTap: onTap,
        items: items,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.secondaryColor,
        backgroundColor: AppColors.backgroundSecondary,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
