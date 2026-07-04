import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import 'app_logo.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.darkBlue,
      elevation: 0,
      titleSpacing: 25,
      title: const AppLogo(),
    );
  }
}