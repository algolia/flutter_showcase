// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:widgetbook/widgetbook.dart';

import 'case/search_cases.dart';
import 'case/ui/styling.dart';

void main() {
  if (kDebugMode) {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) =>
        print('${record.level.name}: ${record.time}: ${record.message}'));
  }
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
                    name: 'search box & hits list',
                    builder: (_) => HitsSearcherCase()),
              ],
              isExpanded: true,
            )
          ],
          isExpanded: true,
        ),
        WidgetbookCategory(
          name: 'Refinements',
          widgets: [
            WidgetbookComponent(
              name: 'Facet List',
              useCases: [
                WidgetbookUseCase(
                  name: 'multiple facet lists',
                  builder: (_) => FacetListCase(),
                )
              ],
              isExpanded: true,
            ),
            WidgetbookComponent(
              name: 'Filter List',
              useCases: [
                WidgetbookUseCase(
                  name: 'static filters',
                  builder: (_) => FilterListCase(),
                )
              ],
              isExpanded: true,
            ),
            WidgetbookComponent(
              name: 'Filter Toggle',
              useCases: [
                WidgetbookUseCase(
                  name: 'facet Toggle',
                  builder: (_) => FilterToggleCase(),
                )
              ],
              isExpanded: true,
            ),
            WidgetbookComponent(
              name: 'Clear Filters',
              useCases: [
                WidgetbookUseCase(
                  name: 'clear All',
                  builder: (_) => ClearFilterCase(),
                )
              ],
              isExpanded: true,
            ),
            WidgetbookComponent(
              name: 'Current Filters',
              useCases: [
                WidgetbookUseCase(
                  name: 'current facets',
                  builder: (_) => CurrentFiltersCase(),
                )
              ],
              isExpanded: true,
            ),
          ],
        ),
        WidgetbookCategory(name: 'Metadata', widgets: [
          WidgetbookComponent(
              name: 'Stats',
              useCases: [
                WidgetbookUseCase(
                  name: 'hits & processing',
                  builder: (_) => StatsCase(),
                ),
              ],
              isExpanded: true)
        ]),
        WidgetbookCategory(name: 'Sorting', widgets: [
          WidgetbookComponent(
              name: 'Sort By',
              useCases: [
                WidgetbookUseCase(
                  name: 'default',
                  builder: (_) => SortByCase(),
                ),
              ],
              isExpanded: true)
        ])
      ],
    );
  }
}
