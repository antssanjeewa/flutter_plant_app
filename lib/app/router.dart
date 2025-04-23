import 'package:go_router/go_router.dart';
import 'package:plant_app/app/pages.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/views/main_screen.dart';
import 'package:plant_app/views/plant_details/plant_details_page.dart';
import 'package:plant_app/views/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: Pages.splash.toPath(),
  routes: [
    //
    GoRoute(
      name: Pages.splash.toPathName(),
      path: Pages.splash.toPath(),
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: Pages.home.toPathName(),
      path: Pages.home.toPath(),
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      name: Pages.plantDetails.toPathName(),
      path: Pages.plantDetails.toPath(),
      builder: (context, state) {
        final plant = state.extra as Plant;
        return PlantDetailsPage(plant: plant);
      },
    ),
  ],
);
