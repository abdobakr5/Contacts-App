import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class FloatingButtons extends StatelessWidget {
  const FloatingButtons({
    super.key,
    required this.isFull,
    required this.isEmpty,
    required this.onAdd,
    required this.onDeleteLast,
  });

  final bool isFull;
  final bool isEmpty;

  final VoidCallback onAdd;
  final VoidCallback onDeleteLast;

  @override
  Widget build(BuildContext context) {
    if (isEmpty) {
      return FloatingActionButton(
        backgroundColor: AppColors.gold,
        onPressed: onAdd,
        child: const Icon(
          Icons.add,
          color: AppColors.darkBlue,
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isFull)
          FloatingActionButton(
            heroTag: "add",
            backgroundColor: AppColors.gold,
            onPressed: onAdd,
            child: const Icon(
              Icons.add,
              color: AppColors.darkBlue,
            ),
          ),

        if (!isFull)
          const SizedBox(height: 12),

        FloatingActionButton(
          heroTag: "delete",
          backgroundColor: AppColors.red,
          onPressed: onDeleteLast,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}