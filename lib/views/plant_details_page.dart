import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/models/plant.dart';

class PlantDetailsPage extends StatelessWidget {
  final Plant plant;
  const PlantDetailsPage({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 65,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: const BorderRadius.all(
                          Radius.elliptical(400, 65),
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
            ),
          ),

          // Scrollable content over the image
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.6 + 15),
                Container(
                  padding: const EdgeInsets.only(top: 28, left: 18),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          SizedBox(
                            width: 15,
                            child: Divider(thickness: 3, color: Colors.green),
                          ),
                          SizedBox(width: 2),
                          SizedBox(
                            width: 35,
                            child: Divider(thickness: 3, color: Colors.green),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Best Choice",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            plant.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                            ),
                            child: Text(
                              plant.category,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "About",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          plant.description,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 40),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Optional: App bar icons over image
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  const Icon(Icons.person, size: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
