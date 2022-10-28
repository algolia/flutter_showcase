import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase/case/ui/styling.dart';

class SearchHits extends StatelessWidget {
  const SearchHits(this.responses, {super.key, this.onRetry});

  final Stream<SearchResponse> responses;
  final VoidCallback? onRetry;

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
        } else if (snapshot.hasError) {
          return Align(
            alignment: Alignment.center,
            child: NoResults(onRetry: onRetry),
          );
        } else {
          return const Align(
            alignment: Alignment.topCenter,
            child: CircularProgressIndicator(),
          );
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

class NoResults extends StatelessWidget {
  const NoResults({Key? key, required this.onRetry}) : super(key: key);

  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.wifi_off,
          size: 48,
          color: AppColors.coolGrey,
        ),
        Text(
          "Can't load search results",
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: AppColors.coolGrey),
        ),
        TextButton(
            onPressed: onRetry,
            child: Text('Try Again',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: AppColors.nebulaBlue)))
      ],
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
