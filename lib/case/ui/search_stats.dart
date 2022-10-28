import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';

import 'styling.dart';

class SearchStats extends StatelessWidget {
  const SearchStats(this.responses, {super.key});

  final Stream<SearchResponse> responses;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SearchResponse>(
        stream: responses,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              stats(snapshot.data),
              style: Theme.of(context)
                  .textTheme
                  .overline
                  ?.copyWith(color: AppColors.proton),
            ),
          );
        });
  }

  String stats(SearchResponse? response) {
    if (response == null) return '';
    final buffer = StringBuffer();
    if (!response.exhaustiveNbHits) buffer.write("~");
    buffer.write("${response.nbHits} hits ");
    buffer.write("in ${response.processingTimeMS} ms");
    return buffer.toString();
  }
}
