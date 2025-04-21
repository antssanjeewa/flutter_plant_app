import 'package:go_router/go_router.dart';
import 'package:plant_app/app/pages.dart';
import 'package:plant_app/views/main_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    //
    GoRoute(
      name: Pages.home.toPathName(),
      path: '/',
      builder: (context, state) => MainScreen(),
    ),
  ],
);
