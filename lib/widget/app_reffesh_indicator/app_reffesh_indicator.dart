import 'package:flutter/material.dart';
import 'package:tinnierenee12/const/app_color.dart';

class AppReffeshIndicator extends StatelessWidget {
  final Future<void> Function()? onRefresh;
  final Widget child;
  final Color backgroundColor;
  final Color indicatorColor;
  final double displacement;
  final double strokeWidth;
  final RefreshIndicatorTriggerMode triggerMode;

  const AppReffeshIndicator({
    super.key,
    required this.child,
    this.onRefresh,
    this.backgroundColor = AppColor.purple,
    this.indicatorColor = AppColor.gold,
    this.displacement = 40.0,
    this.strokeWidth = 2.5,
    this.triggerMode = RefreshIndicatorTriggerMode.onEdge,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:
          onRefresh ??
          () async {
            // Default refresh action (if not provided)
            await Future.delayed(const Duration(seconds: 1));
          },
      backgroundColor: backgroundColor,
      color: indicatorColor,
      displacement: displacement,
      strokeWidth: strokeWidth,
      triggerMode: triggerMode,
      child: child,
    );
  }
}
