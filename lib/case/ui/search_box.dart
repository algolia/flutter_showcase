import 'package:flutter/material.dart';

import 'styling.dart';

class SearchBox extends StatefulWidget {
  SearchBox({super.key, required this.onQuery});

  final textController = TextEditingController();
  final Function(String) onQuery;

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController get controller => widget.textController;

  @override
  void initState() {
    super.initState();
    controller.addListener(() => widget.onQuery(controller.text));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, color: AppColors.nebulaBlue),
            hintText: 'Search here...',
            hintStyle: const TextStyle(color: AppColors.lavenderGray),
            border: InputBorder.none,
            suffixIcon: controller.text.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.close, color: AppColors.mars),
                    color: AppColors.mars,
                    onPressed: controller.clear,
                  ),
          ),
        ),
      ),
    );
  }
}
