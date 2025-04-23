import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/app/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/views/plant_details/widgets/info_with_icon.dart';
import 'package:plant_app/views/plant_details/widgets/plant_info_row.dart';
import 'package:plant_app/views/widgets/shadow_image.dart';
import 'package:readmore/readmore.dart';

class PlantDetailsPage extends StatelessWidget {
  final Plant plant;
  const PlantDetailsPage({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          fixedImage(context),

          // Scrollable content over the image
          plantDetails(context),

          // Optional: App bar icons over image
          topActions(context),
        ],
      ),
    );
  }

  SafeArea topActions(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.lg,
          vertical: AppSize.sm,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(Icons.arrow_back_ios),
            ),
            const Icon(Icons.person, size: AppSize.lg),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView plantDetails(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5 + AppSize.base,
          ),
          Container(
            padding: const EdgeInsets.only(top: AppSize.lg, left: AppSize.base),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.lg),
                topRight: Radius.circular(AppSize.lg),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: AppSize.base,
                      child: Divider(
                        thickness: 3,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 2),
                    SizedBox(
                      width: 35,
                      child: Divider(
                        thickness: 3,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: AppSize.sm),
                    const Text(
                      "Best Choice",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.base),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plant.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          plant.scientificName,
                          style: TextStyle(
                            fontSize: AppFontSize.lg,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.primary,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSize.sm,
                        horizontal: AppSize.base,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(AppSize.lg),
                          bottomLeft: Radius.circular(AppSize.lg),
                        ),
                      ),
                      child: Text(
                        plant.category,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSize.lg,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.lg),
                Padding(
                  padding: const EdgeInsets.only(right: AppSize.base),
                  child: ReadMoreText(
                    plant.description,
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    trimExpandedText: "Less",
                    trimCollapsedText: "read More",
                    moreStyle: TextStyle(
                      fontSize: AppFontSize.sm,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    lessStyle: TextStyle(
                      fontSize: AppFontSize.sm,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: AppSize.xl),

                PlantInfoRow(label: "Family", value: plant.family ?? '-'),
                PlantInfoRow(label: "Origin", value: plant.region ?? '-'),
                PlantInfoRow(label: "Lifetime", value: plant.lifetime ?? '-'),
                PlantInfoRow(
                  label: "Environment",
                  value: plant.environment ?? '-',
                ),
                PlantInfoRow(
                  label: "Propagation",
                  value: plant.propagationMethod ?? '-',
                ),
                const SizedBox(height: AppSize.xl),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InfoWithIcon(
                      icon: Icons.straighten,
                      value: "Size",
                      label: plant.size ?? '-',
                    ),
                    InfoWithIcon(
                      icon: Icons.wb_sunny,
                      value: "Light",
                      label: plant.light ?? '-',
                    ),
                    InfoWithIcon(
                      icon: Icons.water_drop,
                      value: "Humidity",
                      label: plant.humidity ?? '-',
                    ),
                    InfoWithIcon(
                      icon: Icons.height,
                      value: "Height",
                      label: plant.height ?? '-',
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.xl),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox fixedImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      child: ShadowImage(plant: plant, width: 400, height: 65),
    );
  }
}
