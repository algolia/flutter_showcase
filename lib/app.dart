// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_showcase/case/facet_list_case.dart';
import 'package:flutter_showcase/case/filter_state_case.dart';
import 'package:flutter_showcase/case/ui/styling.dart';
import 'package:widgetbook/widgetbook.dart';

import 'case/hits_searcher_case.dart';

void main() {
  runApp(const Showcase());
}

class Showcase extends StatelessWidget {
  const Showcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      appInfo: AppInfo(
        name: 'Algolia Flutter Showcase',
      ),
      themes: [
        WidgetbookTheme(
          name: 'light',
          data: AppTheme.light(),
        ),
      ],
      devices: [
        const Device(
          name: 'Large',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 2436.0,
              width: 1125.0,
            ),
            scaleFactor: 3.0,
          ),
          type: DeviceType.mobile,
        ),
      ],
      frames: [
        WidgetbookFrame.deviceFrame(),
        WidgetbookFrame.defaultFrame(),
      ],
      categories: [
        WidgetbookCategory(
          name: 'Basics',
          widgets: [
            WidgetbookComponent(
                name: 'HitsSearcher',
                useCases: [
                  WidgetbookUseCase(
                      name: 'Default', builder: (_) => HitsSearcherCase()),
                ],
                isExpanded: true)
          ],
          isExpanded: true,
        ),
        WidgetbookCategory(
          name: 'Refinements',
          widgets: [
            WidgetbookComponent(
              name: 'FilterState',
              useCases: [
                WidgetbookUseCase(
                    name: 'Default', builder: (_) => FilterStateCase())
              ],
            ),
            WidgetbookComponent(
              name: 'FacetList',
              useCases: [
                WidgetbookUseCase(
                    name: 'Default', builder: (_) => FacetListCase())
              ],
            )
          ],
        ),
      ],
    );
  }
}
