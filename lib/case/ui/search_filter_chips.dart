import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';

import 'search_filter_chip.dart';

class SearchFilterChips extends StatelessWidget {
  const SearchFilterChips(this.filterState, this.groupID, this.filters,
      {super.key, this.clearable = true});

  final FilterState filterState;
  final bool clearable;
  final FilterGroupID groupID;
  final Iterable<Filter> filters;

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
      final chip = SearchFilterChip(
        filter: filter,
        selected: filterGroups.contains(filter),
        onSelected: (selected) => selected
            ? filterState.add(groupID, {filter})
            : filterState.remove(groupID, {filter}),
      );
      chips.add(chip);
    }
    return chips;
  }
}
