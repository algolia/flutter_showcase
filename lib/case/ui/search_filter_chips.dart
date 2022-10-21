import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class SearchFilterChips extends StatelessWidget {
  const SearchFilterChips(this.filterState, {super.key, this.clearable = true});

  final FilterState filterState;
  final bool clearable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<Filters>(
          stream: filterState.filters,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final filters = snapshot.data!;
              return Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children: [..._filterChipOf(filters)],
              );
            } else {
              return Container();
            }
          }),
    );
  }

  List<Widget> _filterChipOf(Filters filters) {
    final chips = <Widget>[];
    filters.toFilterGroups().forEachIndexed((index, filterGroup) {
      for (var filter in filterGroup) {
        final chip = FilterChip(
          selectedColor: Colors.transparent,
          shape: const StadiumBorder(side: BorderSide()),
          label: Text(
            _chipLabelOf(filter),
            style: TextStyle(color: _categoryColor(index)),
          ),
          onSelected: (bool value) {
            if (clearable) {
              filterState.remove(filterGroup.groupID, {filter});
            }
          },
          selected: true,
        );
        chips.add(chip);
      }
    });
    return chips;
  }

  String _chipLabelOf(Filter filter) {
    switch (filter.runtimeType) {
      case FilterFacet:
        return (filter as FilterFacet).value;
      case FilterTag:
        return (filter as FilterTag).value;
      case FilterNumeric:
        return _numericChipLabel((filter as FilterNumeric).value);
      default:
        throw UnsupportedError(filter.runtimeType.toString());
    }
  }

  String _numericChipLabel(NumericValue value) {
    switch (value.runtimeType) {
      case NumericRange:
        var range = value as NumericRange;
        return '${range.lowerBound} .. ${range.upperBound}';
      case NumericComparison:
        var comparison = value as NumericComparison;
        return '${comparison.operator.operator} ${comparison.number}';
      default:
        throw UnsupportedError(value.runtimeType.toString());
    }
  }

  Color _categoryColor(int index) {
    switch (index) {
      case 0:
        return Colors.pink;
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
