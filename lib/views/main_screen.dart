import 'package:flutter/material.dart';
import 'package:plant_app/views/widgets/app_bottom_navigation_bar.dart';
import 'package:plant_app/views/widgets/my_app_bar.dart';

class MainScreen extends StatelessWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: child,
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
