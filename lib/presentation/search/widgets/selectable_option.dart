import 'package:flutter/material.dart';
import 'package:movie_app/core/configs/theme/app_colors.dart';

class SelectableOption extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool isSelected;
  const SelectableOption({
    super.key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? AppColors.primary : AppColors.secondBackground,
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
