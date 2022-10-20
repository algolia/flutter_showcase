import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';

import 'filters/filter_debug.dart';
import 'ui/search_box.dart';
import 'ui/search_hits.dart';

class FilterStateCase extends StatelessWidget {
  FilterStateCase({super.key});

  final groupID = FilterGroupID.and('products');

  late final filterState = FilterState()
    ..add(groupID, {Filter.facet('categories', 'Cell Phones')})
    ..add(groupID, {Filter.comparison('price', NumericOperator.less, 500)});

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
        children: [
          FilterDebug(filterState, clearable: false),
          Expanded(child: SearchHits(responses: searcher.responses)),
        ],
      ),
    );
  }
}
