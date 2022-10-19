import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';

class SearchHits extends StatelessWidget {
  const SearchHits({super.key, required this.responses});

  final Stream<SearchResponse> responses;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SearchResponse>(
      stream: responses,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final response = snapshot.data ?? SearchResponse({});
          final hits = response.hits.toList();
          return ListView.builder(
            itemCount: hits.length,
            itemBuilder: (context, index) => SearchHitRow(hit: hits[index]),
          );
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }
}

class SearchHitRow extends StatelessWidget {
  const SearchHitRow({super.key, required this.hit});

  final Hit hit;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: SizedBox(
                width: 76, height: 76, child: Image.network(hit['image'])),
          ),
          Expanded(
            child: ListTile(
              title: RichText(
                text: hit
                    .getHighlightedString('name')
                    .toTextSpan(style: Theme.of(context).textTheme.bodyText1),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: RichText(
                text: hit
                    .getHighlightedString('description')
                    .toTextSpan(style: Theme.of(context).textTheme.caption),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              isThreeLine: true,
              trailing: Text(
                "\$${hit['price']}",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension ResponseExt on SearchResponse {
  String stats() {
    final buffer = StringBuffer();
    if (!exhaustiveNbHits) buffer.write("~");
    buffer.write("$nbHits hits ");
    buffer.write("in $processingTimeMS ms");
    return buffer.toString();
  }
}
