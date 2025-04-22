import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/app/constants.dart';
import 'package:plant_app/app/pages.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      "images/image1.png",
      "images/image2.png",
      "images/image3.png",
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "Welcome to",
              style: TextStyle(
                fontSize: AppFontSize.xl,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Plant Guide",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Image.asset(
              "images/profile.png",
              width: 50,
              // color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        hintText: "Search...",
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade100,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
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

            const SizedBox(height: 20),
            MasonryGridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 22,
              crossAxisSpacing: 22,
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return PlantItem(image: imagePaths[index]);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}

class PlantItem extends StatelessWidget {
  const PlantItem({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Pages.plantDetails.toPathName(), extra: image);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade200,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 20,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: const BorderRadius.all(
                          Radius.elliptical(100, 25),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Hero(
                    tag: image,
                    child: Image.asset(image, fit: BoxFit.cover),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade300,
                      ),
                      child: const Icon(Icons.favorite),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Text(
              "Coconut",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Rs. 23.34",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
            color: isActive ? Colors.green : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          height: 4,
          width: 30,
          decoration:
              isActive
                  ? BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  )
                  : const BoxDecoration(),
        ),
      ],
    );
  }
}
