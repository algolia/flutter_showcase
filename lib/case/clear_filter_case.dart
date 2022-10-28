import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';

import 'extensions.dart';
import 'ui/search_ui.dart';

class ClearFilterCase extends StatelessWidget {
  ClearFilterCase({super.key});

  final groupID = const FilterGroupID('products');
  final filters = [
    Filter.facet('categories', 'Cell Phones'),
    Filter.comparison('rating', NumericOperator.greater, 3),
  ];

  late final filterState = FilterState()..add(groupID, filters);

  late final searcher = HitsSearcher(
    applicationID: 'latency',
    apiKey: '6be0576ff61c053d5f9a3225e2a90f76',
    indexName: 'instant_search',
  )..connectFilterState(filterState);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SearchBox(onQuery: searcher.query)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SearchFilterChips(filterState, groupID, filters),
              ),
              SearchClearFilters(filterState),
            ],
          ),
          Expanded(
              child: SearchHits(
            searcher.responses,
            onRetry: searcher.retry,
          )),
        ],
      ),
    );
  }
}
