import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/constants/app_assets.dart';
import '../core/constants/app_colors.dart';

class PreviewCard extends StatelessWidget {
  const PreviewCard({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    this.image,
  });

  final String name;
  final String email;
  final String phone;
  final File? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 110,
              height: 110,
              child: image == null
                  ? Lottie.asset(
                AppAssets.imagePickerAnimation,
                fit: BoxFit.cover,
              )
                  : Image.file(
                image!,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InfoTile(
                  value: name.isEmpty ? "User Name" : name,
                ),

                const Divider(),

                _InfoTile(
                  value: email.isEmpty
                      ? "example@email.com"
                      : email,
                ),

                const Divider(),

                _InfoTile(
                  value: phone.isEmpty
                      ? "+200000000000"
                      : phone,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        value,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: AppColors.darkBlue,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}