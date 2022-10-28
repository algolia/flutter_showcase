import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';

extension HitsSearcherExt on HitsSearcher {
  /// Re-apply the same state to re-trigger search operation.
  void retry() => applyState((state) => state);
}
