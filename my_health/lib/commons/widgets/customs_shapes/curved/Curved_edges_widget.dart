
import 'package:my_health/commons/widgets/customs_shapes/curved/curved_edges.dart';
import 'package:flutter/material.dart';

class TcurvedWidget extends StatelessWidget {
  const TcurvedWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TcustomCurvedEdges(),
      child: child,
    );
  }
}
