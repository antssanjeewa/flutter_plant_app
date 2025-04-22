import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlantDetailsPage extends StatelessWidget {
  final String image;
  const PlantDetailsPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const Icon(Icons.arrow_back, size: 30),
                  ),
                  const Icon(Icons.person_3, size: 30),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 45,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: const BorderRadius.all(
                          Radius.elliptical(300, 45),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Hero(
                    tag: image,
                    child: Image.asset(image, fit: BoxFit.cover, width: 320),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 28, left: 18),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.grey.shade100,
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const Row(
                      children: [
                        SizedBox(
                          width: 45,
                          child: Divider(thickness: 3, color: Colors.black),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Best Choice",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Plant Name",
                          style: TextStyle(
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
                          child: const Text(
                            "Rs. 23.34",
                            style: TextStyle(
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
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        "It looks like you're working on a new Flutter project, and you’re configuring the Gradle setup using the latest plugin approach. Based on the setup, I can guide you through verifying and making sure everything works smoothly.\n\nIt looks like you're working on a new Flutter project, and you’re configuring the Gradle setup using the latest plugin approach. Based on the setup, I can guide you through verifying and making sure everything works smoothly.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "View More",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SingleChildScrollView(),
          ],
        ),
      ),
    );
  }
}
