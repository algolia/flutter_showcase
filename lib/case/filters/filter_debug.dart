import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase/case/ui/styling.dart';

import 'filter_group_converter.dart';

class FilterDebug extends StatefulWidget {
  const FilterDebug(this.filterState, {super.key, this.clearable = true});

  final FilterState filterState;
  final bool clearable;

  @override
  State<FilterDebug> createState() => _FilterDebugState();
}

class _FilterDebugState extends State<FilterDebug> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text('Filters',
                      style: Theme.of(context).textTheme.headline6),
                ),
                if (widget.clearable)
                  IconButton(
                      onPressed: widget.filterState.clear,
                      icon: const Icon(Icons.delete)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: StreamBuilder<Filters>(
                  stream: widget.filterState.filters,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final filters = snapshot.data!;
                      return RichText(
                        text: TextSpan(
                            children: highlighted(filters),
                            style: Theme.of(context).textTheme.bodyText2),
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  List<InlineSpan> highlighted(Filters filters) {
    final spans = <InlineSpan>[];
    final filterGroups = filters.toFilterGroups();
    filterGroups.forEachIndexed((index, group) {
      final unquoted = const FilterGroupConverter().unquoted({group});
      spans.add(
          TextSpan(text: unquoted, style: TextStyle(color: _colorOf(index))));
      if (index < filterGroups.length - 1) {
        spans.add(const TextSpan(
          text: ' AND ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
      }
    });
    if (spans.isEmpty) {
      spans.add(
        const TextSpan(
            text: '(None)',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: AppColors.proton,
            )),
      );
    }
    return spans;
  }

  Color _colorOf(int index) {
    switch (index) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
      case 3:
        return Colors.purple;
      default:
        return Colors.black;
    }
  }
}
