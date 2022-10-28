import 'package:flutter/material.dart';

class SearchSortBy extends StatefulWidget {
  const SearchSortBy({
    super.key,
    required this.sorts,
    required this.onSelect,
    required this.selected,
  });

  final Map<String, String> sorts;
  final ValueChanged<String> onSelect;
  final String selected;

  @override
  State<SearchSortBy> createState() => _SearchSortByState();
}

class _SearchSortByState extends State<SearchSortBy> {
  late var selected = widget.selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DropdownButton(
            value: selected,
            items: widget.sorts.keys
                .map((sort) => DropdownMenuItem(
                      value: sort,
                      child: Text(sort),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() => selected = value!);
              widget.onSelect(widget.sorts[value]!);
            },
            focusColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
