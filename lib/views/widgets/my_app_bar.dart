import 'package:flutter/material.dart';
import 'package:plant_app/app/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSize.sm),
          const Text(
            "Welcome to",
            style: TextStyle(
              fontSize: AppFontSize.xl,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSize.sm),
          Text(
            "Plant Guide",
            style: TextStyle(
              fontSize: AppFontSize.heading,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppSize.base),
          child: Image.asset(
            AppImages.avatar,
            width: 40,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
