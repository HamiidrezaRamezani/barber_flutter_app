import 'package:barber_application/presentation/ui/core/ui_models/filter_ui_model.dart';
import 'package:flutter/material.dart';

import '../../system_design/app_colors.dart';
import '../../system_design/app_sizes.dart';
import '../../system_design/app_typography.dart';

class FilterItem extends StatelessWidget {
  final List<FilterUiModel> filterUiSelectItems;
  final int index;

  const FilterItem(
      {super.key, required this.filterUiSelectItems, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.tabBorderRadius),
        color: (filterUiSelectItems[index].isSelect == true)
            ? AppColors.goldColor
            : Colors.transparent,
        border: Border.all(
            width: 1.0, color: AppColors.whiteColor.withOpacity(0.8)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Center(
          child: Text(
            filterUiSelectItems[index].name,
            style: AppTypography.body(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
