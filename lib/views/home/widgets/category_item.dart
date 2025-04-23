import 'package:flutter/material.dart';
import 'package:plant_app/app/constants.dart';

class CategoryItem extends StatelessWidget {
  final bool isActive;
  final String name;
  const CategoryItem({super.key, required this.name, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            color:
                isActive
                    ? Theme.of(context).colorScheme.primary
                    : AppColors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: AppSize.xs),
          height: 4,
          width: 30,
          decoration:
              isActive
                  ? BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(AppSize.sm),
                  )
                  : const BoxDecoration(),
        ),
      ],
    );
  }
}
