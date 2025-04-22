import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plant_app/app/constants.dart';
import 'package:plant_app/app/pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _countdown = 3;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown == 1) {
        _skip();
      } else {
        setState(() {
          _countdown--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _skip() {
    _timer?.cancel();
    Pages.home.go(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: _skip,
            child: Text("Skip ($_countdown)", style: AppTextStyles.bodyBold),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 1.8,
              child: Image.asset(AppImages.image1),
            ),
            const SizedBox(height: AppSize.base),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.lg),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineMedium,
                  children: [
                    TextSpan(
                      text: "Enjoy Your Life with",
                      style: AppTextStyles.heading.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const TextSpan(
                      text: " Plants",
                      style: AppTextStyles.headingBold,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
