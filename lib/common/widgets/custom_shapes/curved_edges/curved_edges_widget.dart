import 'package:flutter/material.dart';

import 'curved_edges.dart';

class TCurvedEdgesWidgets extends StatelessWidget {
  const TCurvedEdgesWidgets({
    super.key, this.child
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,

    );
  }
}

