import 'package:flutter/material.dart';
import 'package:zepcart/core/common/widgets/curved_edges.dart';

// A Reusable Flutter widget that clips its child using a custom curved edge clipper.
// Enables applying a distinctive curved shape to any widget for decorative UI effects.
class CurvedWidget extends StatelessWidget {
  const CurvedWidget({super.key, this.child});

  // The widget to be clipped with the curved edges.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // Uses a custom clipper to apply curved edges to the child widget.
    return ClipPath(clipper: CustomCurvedEdges(), child: child);
  }
}
