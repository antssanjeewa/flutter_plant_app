import 'package:flutter/material.dart';
import 'package:plant_app/views/home/home_page.dart';
import 'package:plant_app/views/widgets/app_bottom_navigation_bar.dart';
import 'package:plant_app/views/widgets/my_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: HomePage(),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
