import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plant_app/app/constants.dart';
import 'package:plant_app/data/plant_data.dart';
import 'package:plant_app/views/home/widgets/category_item.dart';
import 'package:plant_app/views/widgets/plant_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.base),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSize.lg),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.base),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.surface,
                      hintText: "Search...",
                      hintStyle: const TextStyle(
                        fontSize: AppFontSize.base,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSize.xl,
                        vertical: AppSize.base,
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(width: AppSize.sm),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.base),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: AppSize.base),
                    child: const RotatedBox(
                      quarterTurns: 4,
                      child: Icon(Icons.tune),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryItem(name: "Category 01", isActive: true),
              CategoryItem(name: "Category 02"),
              CategoryItem(name: "Category 03"),
              CategoryItem(name: "Category 04"),
            ],
          ),

          const SizedBox(height: AppSize.base),
          MasonryGridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: AppSize.base,
            crossAxisSpacing: AppSize.base,
            itemCount: plants.length,
            itemBuilder: (context, index) {
              final plant = plants[index];
              return PlantItem(plant: plant);
            },
          ),
          const SizedBox(height: AppSize.xl),
        ],
      ),
    );
  }
}
