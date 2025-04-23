import 'package:flutter/material.dart';
import 'package:plant_app/app/constants.dart';

class InfoWithIcon extends StatelessWidget {
  const InfoWithIcon({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSize.sm),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: AppSize.lg,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: AppSize.xs),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppFontSize.xs,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppFontSize.xs,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
