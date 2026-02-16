import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tinnierenee12/const/app_color.dart';

class AppLoading extends StatelessWidget {
  final double? size;
  final Color? color;
  const AppLoading({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return SpinKitSpinningLines(
      
      color: color ?? AppColor.gold,
      size: size ?? 50.0,
    );
  }
}
