import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/app/constants.dart';
import 'package:plant_app/app/pages.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/views/widgets/shadow_image.dart';

class PlantItem extends StatelessWidget {
  const PlantItem({super.key, required this.plant});

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Pages.plantDetails.toPathName(), extra: plant);
      },
      child: Container(
        padding: const EdgeInsets.all(AppSize.base),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.base),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ShadowImage(plant: plant, width: 160, height: 25),
                // Positioned.fill(
                //   child: Align(
                //     alignment: Alignment.bottomCenter,
                //     child: Container(
                //       height: 25,
                //       width: 160,
                //       decoration: BoxDecoration(
                //         color: Theme.of(context).colorScheme.secondary,
                //         borderRadius: const BorderRadius.all(
                //           Radius.elliptical(160, 25),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Center(
                //   child: Hero(
                //     tag: plant.image,
                //     child: Image.asset(plant.image, fit: BoxFit.cover),
                //   ),
                // ),
                // GestureDetector(
                //   onTap: () {},
                //   child: Align(
                //     alignment: Alignment.topRight,
                //     child: Container(
                //       padding: const EdgeInsets.all(6),
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(50),
                //         color: AppColors.grey.shade300,
                //       ),
                //       child: const Icon(Icons.favorite),
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: AppSize.xs),
            Text(
              plant.name,
              style: const TextStyle(
                fontSize: AppFontSize.lg,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              plant.scientificName,
              style: TextStyle(
                fontSize: AppFontSize.sm,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
