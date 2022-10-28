import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase/case/ui/styling.dart';

class SearchClearFilters extends StatelessWidget {
  const SearchClearFilters(this.filterState, {super.key});

  final FilterState filterState;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => filterState.clear(),
      icon: const Icon(Icons.clear_all, color: AppColors.coolGrey),
    );
  }
}
