import 'package:flutter/material.dart';

extension SpacedRow on Row {
  Row withSpacing(double spacing) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment,
      children:
          _addSpacingBetweenChildren(children, spacing, isHorizontal: true),
    );
  }
}

extension SpacedColumn on Column {
  Column withSpacing(double spacing) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment,
      children:
          _addSpacingBetweenChildren(children, spacing, isHorizontal: false),
    );
  }
}

// Helper function for spacing
List<Widget> _addSpacingBetweenChildren(List<Widget> children, double spacing,
    {required bool isHorizontal}) {
  if (children.isEmpty) return [];
  return children
      .expand((child) => [
            child,
            isHorizontal ? SizedBox(width: spacing) : SizedBox(height: spacing),
          ])
      .toList()
    ..removeLast(); // Remove the trailing spacing
}
