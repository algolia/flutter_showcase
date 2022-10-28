import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';

import 'search_filter_chip.dart';

class SearchToggleFilter extends StatelessWidget {
  const SearchToggleFilter(
      this.filterState, this.groupID, this.filter, this.label,
      {super.key});

  final FilterState filterState;
  final FilterGroupID groupID;
  final Filter filter;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
          stream: filterState.filters,
          builder: (context, snapshot) {
            final filters =
                snapshot.hasData ? snapshot.data! : StatelessFilters();
            final filterGroups =
                filters.toFilterGroups().expand((group) => group);
            return SearchFilterChip(
              label: label,
              filter: filter,
              selected: filterGroups.contains(filter),
              onSelected: (selected) => selected
                  ? filterState.add(groupID, {filter})
                  : filterState.remove(groupID, {filter}),
            );
          }),
    );
  }
}
