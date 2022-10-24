import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase/case/ui/filters_extensions.dart';
import 'package:flutter_showcase/case/ui/styling.dart';

class SearchInputChips extends StatelessWidget {
  const SearchInputChips(this.filterState, {super.key, this.clearable = true});

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
                children: [..._inputChipsOf(context, filters)],
              );
            } else {
              return Container();
            }
          }),
    );
  }

  List<Widget> _inputChipsOf(BuildContext context, Filters filters) {
    final chips = <Widget>[];
    for (var filterGroup in filters.toFilterGroups()) {
      for (var filter in filterGroup) {
        final chip = InputChip(
          backgroundColor: AppColors.coolGrey,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          label: Text(
            filter.toLabel(),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AppColors.white),
          ),
          onDeleted: clearable
              ? () => filterState.remove(filterGroup.groupID, {filter})
              : null,
          deleteIconColor: AppColors.white,
          isEnabled: true,
        );
        chips.add(chip);
      }
    }
    return chips;
  }
}
