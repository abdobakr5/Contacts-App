import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/constants/app_assets.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_strings.dart';

class EmptyContacts extends StatelessWidget {
  const EmptyContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 368,
              child: Lottie.asset(
                AppAssets.emptyAnimation,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              AppStrings.noContacts,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.gold,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}