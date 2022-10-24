import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';

import 'ui/search_box.dart';
import 'ui/search_filter_chips.dart';
import 'ui/search_hits.dart';

class FilterStateCase extends StatelessWidget {
  FilterStateCase({super.key});

  final groupID = const FilterGroupID('products');
  final filters = [
    Filter.facet('categories', 'Cell Phones'),
    Filter.range('price', lowerBound: 50, upperBound: 300),
    Filter.comparison('rating', NumericOperator.greater, 3),
  ];

  late final filterState = FilterState()..add(groupID, {filters[0]});

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
          SearchFilterChips(filterState, groupID, filters,
              clearable: false),
          Expanded(child: SearchHits(responses: searcher.responses)),
        ],
      ),
    );
  }
}
