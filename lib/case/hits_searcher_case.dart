import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';

import 'ui/search_box.dart';
import 'ui/search_hits.dart';

class HitsSearcherCase extends StatelessWidget {
  HitsSearcherCase({super.key});

  final searcher = HitsSearcher(
    applicationID: 'latency',
    apiKey: '6be0576ff61c053d5f9a3225e2a90f76',
    indexName: 'instant_search',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SearchBox(onQuery: searcher.query)),
      body: SearchHits(responses: searcher.responses),
    );
  }
}
