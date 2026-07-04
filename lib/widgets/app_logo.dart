import 'package:flutter/material.dart';

import '../core/constants/app_assets.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.height = 40,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.logo,
      height: height,
      fit: BoxFit.contain,
    );
  }
}