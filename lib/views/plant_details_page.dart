import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/models/plant.dart';
import 'package:readmore/readmore.dart';

class PlantDetailsPage extends StatelessWidget {
  final Plant plant;
  const PlantDetailsPage({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.5 + 15),
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
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
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
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: ReadMoreText(
                          plant.description,
                          trimLines: 3,
                          trimMode: TrimMode.Line,
                          trimExpandedText: "Less",
                          trimCollapsedText: "read More",
                          moreStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          lessStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      PlantInfoRow(label: "Family", value: plant.family ?? '-'),
                      PlantInfoRow(label: "Origin", value: plant.region ?? '-'),
                      PlantInfoRow(
                        label: "Lifetime",
                        value: plant.lifetime ?? '-',
                      ),
                      PlantInfoRow(
                        label: "Environment",
                        value: plant.environment ?? '-',
                      ),
                      PlantInfoRow(
                        label: "Propagation",
                        value: plant.propagationMethod ?? '-',
                      ),
                      const SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _InfoIcon(
                            icon: Icons.straighten,
                            label: "Size",
                            value: plant.size ?? '-',
                          ),
                          _InfoIcon(
                            icon: Icons.wb_sunny,
                            label: "Light",
                            value: plant.light ?? '-',
                          ),
                          _InfoIcon(
                            icon: Icons.water_drop,
                            label: "Humidity",
                            value: plant.humidity ?? '-',
                          ),
                          _InfoIcon(
                            icon: Icons.height,
                            label: "Height",
                            value: plant.height ?? '-',
                          ),
                        ],
                      ),
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

  Column _InfoIcon({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color(0xFFDFF5E1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 24, color: Colors.green),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Column PlantInfoRow({required String label, required String value}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
      ],
    );
  }
}
