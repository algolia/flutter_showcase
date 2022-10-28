import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';

import 'extensions.dart';
import 'ui/search_ui.dart';

class SortByCase extends StatelessWidget {
  SortByCase({super.key});

  final indices = {
    'Relevance': 'instant_search',
    'Price asc.': 'instant_search_price_asc',
    'Price desc.': 'instant_search_price_desc',
  };

  late final selectedIndex = indices.entries.first;

  late final searcher = HitsSearcher(
    applicationID: 'latency',
    apiKey: '6be0576ff61c053d5f9a3225e2a90f76',
    indexName: selectedIndex.value,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SearchBox(onQuery: searcher.query)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchSortBy(
            sorts: indices,
            selected: selectedIndex.key,
            onSelect: (indexName) => searcher
                .applyState((state) => state.copyWith(indexName: indexName)),
          ),
          Expanded(
              child: SearchHits(searcher.responses, onRetry: searcher.retry)),
        ],
      ),
    );
  }
}
