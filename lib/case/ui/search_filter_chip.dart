import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';

import 'filters_extensions.dart';
import 'styling.dart';

class SearchFilterChip extends StatelessWidget {
  const SearchFilterChip({
    super.key,
    required this.filter,
    required this.selected,
    required this.onSelected,
    this.label,
  });

  final Filter filter;
  final bool selected;
  final Function(bool selected) onSelected;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      backgroundColor: AppColors.proton,
      selectedColor: AppColors.coolGrey,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      label: Text(
        label ?? filter.toLabel(),
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(color: AppColors.white),
      ),
      onSelected: onSelected,
      selected: selected,
      checkmarkColor: AppColors.white,
    );
  }
}
