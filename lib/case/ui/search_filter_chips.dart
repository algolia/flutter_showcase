import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase/case/ui/filters_extensions.dart';
import 'package:flutter_showcase/case/ui/styling.dart';

class SearchFilterChips extends StatelessWidget {
  const SearchFilterChips(this.filterState, this.groupID, this.filters,
      {super.key, this.clearable = true});

  final FilterState filterState;
  final bool clearable;
  final FilterGroupID groupID;
  final List<Filter> filters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<Filters>(
          stream: filterState.filters,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final appliedFilters = snapshot.data!;
              return Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children: [..._filterChipsOf(context, appliedFilters)],
              );
            } else {
              return Container();
            }
          }),
    );
  }

  List<Widget> _filterChipsOf(BuildContext context, Filters appliedFilters) {
    final chips = <Widget>[];
    var filterGroups = appliedFilters.toFilterGroups().expand((group) => group);
    for (var filter in filters) {
      final chip = FilterChip(
        backgroundColor: AppColors.proton,
        selectedColor: AppColors.coolGrey,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        label: Text(
          filter.toLabel(),
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: AppColors.white),
        ),
        onSelected: (selected) => selected
            ? filterState.add(groupID, {filter})
            : filterState.remove(groupID, {filter}),
        selected: filterGroups.contains(filter),
        checkmarkColor: AppColors.white,
      );
      chips.add(chip);
    }
    return chips;
  }
}
