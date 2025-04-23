import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';

class ShadowImage extends StatelessWidget {
  const ShadowImage({
    super.key,
    required this.plant,
    required this.width,
    required this.height,
  });

  final Plant plant;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.all(
                  Radius.elliptical(width, height),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Hero(
            tag: plant.image,
            child: Image.asset(plant.image, fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
