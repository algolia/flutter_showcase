import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';

import 'extensions.dart';
import 'ui/search_ui.dart';

class CurrentFiltersCase extends StatelessWidget {
  CurrentFiltersCase({super.key});

  final filterState = FilterState();

  late final searcher = HitsSearcher(
    applicationID: 'latency',
    apiKey: '6be0576ff61c053d5f9a3225e2a90f76',
    indexName: 'instant_search',
  )..connectFilterState(filterState);

  late final categoriesFacets = FacetList(
    searcher: searcher,
    filterState: filterState,
    attribute: 'categories',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SearchBox(onQuery: searcher.query)),
      drawer: Drawer(
          child: Card(
              child: SearchFacets(
            title: 'Categories',
            facets: categoriesFacets.facets,
            onClick: categoriesFacets.toggle,
          ))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchInputChips(filterState),
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
