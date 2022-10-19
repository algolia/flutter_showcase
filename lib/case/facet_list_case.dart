import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';

import 'ui/search_box.dart';
import 'ui/search_facets.dart';
import 'ui/search_hits.dart';

class FacetListCase extends StatelessWidget {
  FacetListCase({super.key});

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

  late final brandFacets = FacetList(
    searcher: searcher,
    filterState: filterState,
    attribute: 'brand',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SearchBox(onQuery: searcher.query)),
      drawer: Drawer(
          child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Card(
                  child: SearchFacets(
                title: 'Categories',
                facets: categoriesFacets.facets,
                onClick: categoriesFacets.toggle,
              ))),
          Expanded(
              flex: 1,
              child: Card(
                  child: SearchFacets(
                title: 'Brands',
                facets: brandFacets.facets,
                onClick: brandFacets.toggle,
              ))),
        ],
      )),
      body: SearchHits(responses: searcher.responses),
    );
  }
}
